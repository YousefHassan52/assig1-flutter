import 'package:assig1/shared/components/widgets/text_form_field.dart';
import 'package:assig1/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/cubit/cubit.dart';

class SignUP extends StatelessWidget {
  const SignUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>
      (builder: (context,state){
      return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              defaultTextFormField(
                  controller: cubit.phoneController,
                  validate: (value){},
                  text: "Phone",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone),

              defaultTextFormField(
                  controller: cubit.emailController,
                  validate: (value){},
                  text: "Email Address",
                  prefixIcon: Icons.alternate_email,
                  keyboardType: TextInputType.emailAddress),

              defaultTextFormField(
                  controller: cubit.personNameController,
                  validate: (value){},
                  text: "Full Name",
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.text),
              defaultTextFormField(
                  controller: cubit.companyNameController,
                  validate: (value){},
                  text: "Company Name",
                  prefixIcon: Icons.home_repair_service,
                  keyboardType: TextInputType.text),
              defaultTextFormField(
                  controller: cubit.companyIndustryController,
                  validate: (value){},
                  text: "Company Industry",
                  prefixIcon: Icons.build_circle_outlined,
                  keyboardType: TextInputType.text),
              defaultTextFormField(
                  controller: cubit.companyAddressController,
                  validate: (value){},
                  text: "Company Address",
                  prefixIcon: Icons.location_on_sharp,
                  keyboardType: TextInputType.text),
              defaultTextFormField(
                  controller: cubit.companyLocationController,
                  validate: (value){},
                  text: "Company Long & Lat",
                  prefixIcon: Icons.location_searching_sharp,
                  keyboardType: TextInputType.text),

            ],
          ),
        ),
      );
    }, listener:(context,state){} );
  }
}
