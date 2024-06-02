import 'package:flutter/material.dart';
import 'package:pets/models/health_issue.dart';
import 'package:pets/pages/thankyou_page.dart'; // Import the Thank You Page

class VeterinaryServicesPage extends StatefulWidget {
  @override
  _VeterinaryServicesPageState createState() => _VeterinaryServicesPageState();
}

class _VeterinaryServicesPageState extends State<VeterinaryServicesPage> {
  final List<HealthIssue> healthIssues = [
    HealthIssue(name: 'Fever'),
    HealthIssue(name: 'Running Nose'),
    HealthIssue(name: 'Vomiting'),
    HealthIssue(name: 'Diarrhea'),
    HealthIssue(name: 'Skin Irritation'),
    HealthIssue(name: 'Lethargy'),
  ];

  bool get isAnyIssueSelected {
    return healthIssues.any((issue) => issue.isSelected);
  }

  void _submit() {
    List<String> selectedIssues = healthIssues
        .where((issue) => issue.isSelected)
        .map((issue) => issue.name)
        .toList();

    // Navigate to Thank You Page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThankYouPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veterinary Services'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/dogbg.png"), // Set your background image here
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.dstATop), // Set background image opacity
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: healthIssues.map((issue) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0), // Adjust padding
                    child: Card(
                      color: Colors.white.withOpacity(0.2), // Set background opacity
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CheckboxListTile(
                          title: Text(
                            issue.name,
                            style: TextStyle(fontSize: 18), // Adjust font size
                          ),
                          value: issue.isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              issue.isSelected = value ?? false;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (isAnyIssueSelected)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: _submit,
                  child: Text('Submit'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
