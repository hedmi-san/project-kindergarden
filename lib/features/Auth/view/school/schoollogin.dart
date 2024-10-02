// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:project_kindergarden/theme/theme.dart';

final phoneNumber = TextEditingController();
final password = TextEditingController();

class SchoolLoginScreen extends StatelessWidget {
  const SchoolLoginScreen({super.key});

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
                        'assets/images/school login background image.png'),
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.green.withOpacity(0.8), BlendMode.overlay)),
              ),
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Login école',
                      style: TextStyle(color: Colors.white, fontSize: 29),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {},
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
                    Column(
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
                          height: MediaQuery.sizeOf(context).height * 0.02,
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
                          height: MediaQuery.sizeOf(context).height * 0.05,
                        ),
                        const PhoneNumberTextForm(),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.001,
                        ),
                        const PasswordTextForm(),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.015,
                        ),
                        const LoginButton(),
                        const Text(
                          'Or',
                        ),
                        const SignupButton(),
                      ],
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

class PhoneNumberTextForm extends StatefulWidget {
  const PhoneNumberTextForm({
    super.key,
  });

  @override
  _PhoneNumberTextFormState createState() => _PhoneNumberTextFormState();
}

class _PhoneNumberTextFormState extends State<PhoneNumberTextForm> {
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
            keyboardType: TextInputType.number,
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

class PasswordTextForm extends StatefulWidget {
  const PasswordTextForm({
    super.key,
  });

  @override
  _PasswordTextFormState createState() => _PasswordTextFormState();
}

class _PasswordTextFormState extends State<PasswordTextForm> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Mot de passe',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: password,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: 'mot de passe',
              hintStyle: const TextStyle(
                color: Pallete.disablegreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
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
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Login',
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

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.89,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          side: const BorderSide(
            color: Pallete.bordergreyColor,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Sign up',
            style: TextStyle(
              fontFamily: 'Nunito',
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
