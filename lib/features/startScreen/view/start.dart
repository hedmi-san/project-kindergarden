import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_kindergarden/theme/pallete.dart';

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
              height: MediaQuery.sizeOf(context).height * 0.18,
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
              height: MediaQuery.sizeOf(context).height * 0.022,
            ),
            const Text(
              'Vous êtes ...',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _selectButton(0),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedButtonIndex == 0
                        ? Pallete.primarygreenColor
                        : Colors.grey,
                  ),
                  child: const Text('école'),
                ),
                ElevatedButton(
                  onPressed: () => _selectButton(1),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _selectedButtonIndex == 1 ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('enseignant'),
                ),
                ElevatedButton(
                  onPressed: () => _selectButton(2),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _selectedButtonIndex == 2 ? Colors.blue : Colors.grey,
                  ),
                  child: const Text('élève'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
