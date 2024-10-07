// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kindergarden/constants/data.dart';
import 'package:project_kindergarden/theme/pallete.dart';
import 'package:intl/intl.dart';

import '../../../Home/student/studenthome.dart';

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
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Gendre',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.018,
              ),
              StateMunicipalitySelector(
                algeriaStates: algeriaStates,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.018,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Niveau éducatif',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
                    hintText: 'niveau',
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 14),
                    width: MediaQuery.sizeOf(context).width * 0.82,
                    dropdownMenuEntries: educationalSystem
                        .map((e) => DropdownMenuEntry(value: e, label: e))
                        .toList(),
                    onSelected: (value) {},
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.03,
              ),
              const DoneButton(),
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  hintText: 'Sélectionner une date',
                  hintStyle: TextStyle(
                    color: Colors.grey,
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

class StateMunicipalitySelector extends StatefulWidget {
  final List<dynamic> algeriaStates;

  const StateMunicipalitySelector({super.key, required this.algeriaStates});

  @override
  _StateMunicipalitySelectorState createState() =>
      _StateMunicipalitySelectorState();
}

class _StateMunicipalitySelectorState extends State<StateMunicipalitySelector> {
  String? selectedState;
  String? selectedMunicipality;
  List<Map<String, String>> municipalities = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text(
            'Lieu de naissance',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildStyledDropdown(
              hint: 'Wilaya',
              value: selectedState,
              items: widget.algeriaStates.map((state) {
                return DropdownMenuItem<String>(
                  value: state['name_fr'],
                  child: Text(state['name_fr']),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedState = newValue;
                  selectedMunicipality = null;
                  if (newValue != null) {
                    var selectedStateData = widget.algeriaStates.firstWhere(
                      (state) => state['name_fr'] == newValue,
                    );
                    municipalities = List<Map<String, String>>.from(
                        selectedStateData['communes']);
                  } else {
                    municipalities = [];
                  }
                });
              },
            ),
            _buildStyledDropdown(
              hint: 'Baladiya',
              value: selectedMunicipality,
              items: municipalities.map((municipality) {
                return DropdownMenuItem<String>(
                  value: municipality['name_fr'],
                  child: Text(municipality['name_fr']!),
                );
              }).toList(),
              onChanged: selectedState == null
                  ? null
                  : (String? newValue) {
                      setState(() {
                        selectedMunicipality = newValue;
                      });
                    },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStyledDropdown({
    required String hint,
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?>? onChanged,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.38,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text(
            hint,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          value: value,
          items: items,
          onChanged: onChanged,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.black, fontSize: 14),
          dropdownColor: Colors.white,
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  const DoneButton({
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
          Get.off(() => const StudentHomeScreen());
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Confirmer',
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
