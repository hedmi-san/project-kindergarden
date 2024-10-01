import 'package:flutter/material.dart';

class StudentLoginScreen extends StatelessWidget {
  const StudentLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          title: const Text('Login étudiant'),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}

/** page architecture
 * card 1st parent : 
 *  image
 *  row text and <-
 *  sized box 
 *  container 2nd parent 
 *    text 
 *    text
 *    tex input 
 *    buttons 
 * 
 */