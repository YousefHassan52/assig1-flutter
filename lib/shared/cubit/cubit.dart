import 'package:assig1/shared/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit():super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);

/*
* 2.1. Company Name (mandatory field)
2.2. Contact Person Name (mandatory field)
2.3. Company Industry (Checkbox List– optional field)
2.4. Contact Person Phone Number (Phone Number structure validation - mandatory field)
2.5. Email (Email structure validation - mandatory field)
2.6. Company Address (mandatory field)
2.7. Company Location [Long. – Lat. ] (mandatory field)
2.8. Company Size (4 options only {Micro, Small, Mini, Large} – optional field)
2.9. Password (at least 8 characters - mandatory field)
2.10. Confirm password (at least 8 characters – matching password field - mandatory field*/
  var phoneController=TextEditingController();
  var emailController=TextEditingController();
  var personNameController=TextEditingController();
  var companyNameController=TextEditingController();
  var companyIndustryController=TextEditingController();
  var companyAddressController=TextEditingController();
  var companyLocationController=TextEditingController();
  var companySizeController=TextEditingController();
  var passwordController=TextEditingController();
    var formKey=GlobalKey<FormState>();

  late Database data;

  void createDatabase() {
    openDatabase(
      "assignment_app",
      version: 1,
      onCreate: (database, version) {
         print("table created");
        database.execute(
            "CREATE TABLE users(phone TEXT PRIMARY KEY,email TEXT,companyName TEXT,personName TEXT,companyIndustry TEXT,companyAddress TEXT,companyLocation TEXT,companySize TEXT,password TEXT,)")
            .then((value) {
           print("table created");
        }).catchError((error) {
           print("error while creating table tasks: ${error.toString()}");
        });
      },
      onOpen: (database) {
         print("database opened");
        getData(database);
      },
    ).then((value) {
      // el value heya el database
      data = value;
      emit(CreateDatabaseTodoState()); // ha emit lma ye5las 34an kda badal ma 2a2ol data=await openDatabase 2olt data = vale fa heya heya

    });
  }

  List<Map> users=[];

  void getData(Database database) {
      users=[];
    database.rawQuery('SELECT * FROM users').then((value) {
      for (var element in value) {
          users.add(element);

      }


      emit(GetFromDatabaseTodoState());
    });
  }



  Future insertToDatabase({
    required String phone,
    required String email,
    required String personName,
    required String companyName,
    required String companyIndustry,
    required String companyAddress,
    required String companyLocation,
    required String companySize,
    required String password,


  }) async {
    await data.transaction((txn) {
      return txn.rawInsert(
          'INSERT INTO users(phone,email,personName,companyName,companyIndustry,companyAddress,companyLocation,companySize,password) VALUES ("$phone","$email","$personName","$companyName","$companyIndustry","$companyAddress","$companyLocation","$companySize","$password")')
          .then((value) {
        // print("record of id $value is added");
        emit(InsertIntoDatabaseTodoState());
        getData(data);
      })
          .catchError((error) {
        // print("error while inserting data ${error.toString()}");
      });
    });
  }

}