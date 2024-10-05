// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kindergarden/features/Auth/view/teacher/secondteachersignup.dart';
import 'package:project_kindergarden/features/Auth/view/teacher/teacherlogin.dart';
import 'package:project_kindergarden/theme/theme.dart';

final phoneNumber = TextEditingController();
final familyname = TextEditingController();
final name = TextEditingController();

class TeacherSignUp extends StatelessWidget {
  const TeacherSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.31,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(
                      'assets/images/teacher login background image.jpg'),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Colors.green.withOpacity(0.8), BlendMode.overlay),
                ),
              ),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Sign up enseignant',
                      style: TextStyle(color: Colors.white, fontSize: 29),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Get.off(const TeacherLoginScreen());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 29,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.19,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.72,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.03,
                          ),
                          const Text(
                            'Bienvenue sur',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                          const Text(
                            'مُراسَلتِي',
                            style: TextStyle(
                              color: Pallete.secondarygreenColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01,
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.85,
                            child: const Text(
                              'Connecter les étudiants, les parents et les écoles pour un avenir meilleur.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Pallete.textgreyColor, fontSize: 15),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.01,
                          ),
                          const NameTextForm(),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.001,
                          ),
                          const FamilyNameTextForm(),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.015,
                          ),
                          const PhoneNumberTextForm(),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.015,
                          ),
                          const LoginButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NameTextForm extends StatefulWidget {
  const NameTextForm({
    super.key,
  });

  @override
  _NameTextFormState createState() => _NameTextFormState();
}

class _NameTextFormState extends State<NameTextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Nom',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: name,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: 'Nom',
              hintStyle: TextStyle(
                color: Pallete.disablegreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FamilyNameTextForm extends StatefulWidget {
  const FamilyNameTextForm({
    super.key,
  });

  @override
  _FamilyNameTextFormState createState() => _FamilyNameTextFormState();
}

class _FamilyNameTextFormState extends State<FamilyNameTextForm> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Prénom',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: familyname,
            keyboardType: TextInputType.name,
            obscureText: obscureText,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: 'Prénom',
              hintStyle: TextStyle(
                color: Pallete.disablegreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PhoneNumberTextForm extends StatefulWidget {
  const PhoneNumberTextForm({
    super.key,
  });

  @override
  _PhoneNumberTextFormState createState() => _PhoneNumberTextFormState();
}

class _PhoneNumberTextFormState extends State<PhoneNumberTextForm> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'N° telephone',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: phoneNumber,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: 'xx-xx-xx-xx-xx',
              hintStyle: TextStyle(
                color: Pallete.disablegreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          backgroundColor: Pallete.primarygreenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Get.to(const TeacherConfirmSignUpScreen());
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Next',
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
