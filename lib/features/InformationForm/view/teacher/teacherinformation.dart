import 'package:flutter/material.dart';

class TeacherInfoScreen extends StatelessWidget {
  const TeacherInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Row(
              children: [
                Text('Enseignant'),
                Text('مُراسَلتِي'),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.002,
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
