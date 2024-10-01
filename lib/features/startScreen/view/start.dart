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
                  fontSize: 15,
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
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.021,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: 'école',
                  selection: _selectButton,
                  index: 0,
                  isSelected: _selectedButtonIndex == 0,
                ),
                CustomButton(
                  text: 'enseignent',
                  selection: _selectButton,
                  index: 1,
                  isSelected: _selectedButtonIndex == 1,
                ),
                CustomButton(
                  text: 'étudiant',
                  selection: _selectButton,
                  index: 2,
                  isSelected: _selectedButtonIndex == 2,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.025,
            ),
            ContinueButton(
              selectedindex: _selectedButtonIndex,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function(int) selection;
  final int index;
  final bool isSelected;
  final String text;

  const CustomButton({
    super.key,
    required this.text,
    required this.selection,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selection(index),
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
            color: isSelected ? Pallete.primarygreenColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Pallete.bordergreyColor)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Pallete.disablegreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
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
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (selectedindex == 0) {
            Get.to(const SchoolLoginScreen());
          } else if (selectedindex == 1) {
            Get.to(const TeacherLoginScreen());
          } else if (selectedindex == 2) {
            Get.to(const StudentLoginScreen());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Selectioner un role SVP'),
                duration: Duration(milliseconds: 1500),
              ),
            );
          }
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Continuer',
            style: TextStyle(
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
