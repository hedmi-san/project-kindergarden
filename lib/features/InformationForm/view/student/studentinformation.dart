import 'package:flutter/material.dart';

class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Row(
              children: [
                Text('élève'),
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
