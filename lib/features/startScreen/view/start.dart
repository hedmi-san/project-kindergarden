import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_kindergarden/features/Auth/view/school/schoollogin.dart';
import 'package:project_kindergarden/features/Auth/view/student/studentlogin.dart';
import 'package:project_kindergarden/features/Auth/view/teacher/teacherlogin.dart';
import 'package:project_kindergarden/theme/pallete.dart';
import 'package:get/get.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectedButtonIndex = -1;

  void _selectButton(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.175,
            ),
            SvgPicture.asset('assets/images/Teacher student-pana 1@2x.svg'),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.17,
              width: MediaQuery.sizeOf(context).width * 0.73,
              child: const Text(
                'Nous relions les élèves, les parents et l\'administration scolaire pour un avenir meilleur.Commencez à explorer toutes les fonctionnalités et services que nous offrons.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.02,
            ),
            const Text(
              'Vous êtes ...',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.021,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _selectButton(0),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedButtonIndex == 0
                        ? Pallete.secondarygreenColor
                        : Colors.transparent,
                  ),
                  child: const Text('école'),
                ),
                ElevatedButton(
                  onPressed: () => _selectButton(1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedButtonIndex == 1
                        ? Pallete.secondarygreenColor
                        : Colors.white,
                  ),
                  child: const Text('enseignant'),
                ),
                ElevatedButton(
                  onPressed: () => _selectButton(2),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedButtonIndex == 2
                        ? Pallete.secondarygreenColor
                        : Colors.transparent,
                  ),
                  child: const Text('élève'),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.025,
            ),
            SelectionnerButton(
              selectedindex: _selectedButtonIndex,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.selcto});
  VoidCallback selcto;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: selcto,
      child: Container(),
    );
  }
}

class SelectionnerButton extends StatelessWidget {
  const SelectionnerButton({
    super.key,
    required this.selectedindex,
  });
  final int selectedindex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Pallete.secondarygreenColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          if (selectedindex == 0) {
            Get.to(const SchoolLoginScreen());
          } else if (selectedindex == 1) {
            Get.to(const TeacherLoginScreen());
          } else if (selectedindex == 2) {
            Get.to(const StudentLoginScreen());
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Continuer',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'poppins',
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
