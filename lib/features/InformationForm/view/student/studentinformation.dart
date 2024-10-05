import 'package:flutter/material.dart';
import 'package:project_kindergarden/constants/data.dart';
import 'package:project_kindergarden/theme/pallete.dart';
import 'package:intl/intl.dart';

final date = TextEditingController();

final class StudentInfoScreen extends StatelessWidget {
  const StudentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'élève',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    'مُراسَلتِي',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                      color: Pallete.secondarygreenColor,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.14,
                width: MediaQuery.sizeOf(context).width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: const AssetImage(
                        'assets/images/student login blur background image.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.green.withOpacity(0.7),
                      BlendMode.overlay,
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Bienvenue sur Morassalaty!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Connectez-vous avec votre école et vos parents et Facilitez la communication et la collaboration.',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              const Text(
                'Information Form',
                style: TextStyle(
                  color: Pallete.secondarygreenColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.025,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gendre',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  DropdownMenu(
                    inputDecorationTheme: InputDecorationTheme(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hintText: 'gendre',
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    width: MediaQuery.sizeOf(context).width * 0.82,
                    dropdownMenuEntries: gendres
                        .map((e) => DropdownMenuEntry(value: e, label: e))
                        .toList(),
                    onSelected: (value) {},
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.018,
              ),
              const DatepickerForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class DatepickerForm extends StatefulWidget {
  const DatepickerForm({super.key});

  @override
  State<DatepickerForm> createState() => _DatepickerFormState();
}

class _DatepickerFormState extends State<DatepickerForm> {
  @override
  void dispose() {
    date.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        date.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Date de naissance',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GestureDetector(
            onTap: () => _selectDate(context),
            child: AbsorbPointer(
              child: TextField(
                controller: date,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  hintText: 'Sélectionner une date',
                  hintStyle: TextStyle(
                    color: Colors
                        .grey, // Replace with Pallete.disablegreyColor if available
                    fontSize: 14,
                    fontWeight: FontWeight.w100,
                  ),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
