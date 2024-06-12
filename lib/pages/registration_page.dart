import 'package:flutter/material.dart';

/// A stateful widget for the registration page.
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  String? _gender;
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _middleNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryPage(
            firstName: _firstNameController.text,
            middleName: _middleNameController.text,
            lastName: _lastNameController.text,
            gender: _gender!,
            email: _emailController.text,
            phone: _phoneController.text,
            country: _countryController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(labelText: 'First Name'),
                    validator: (value) => value!.isEmpty ? 'Enter your first name' : null,
                  ),
                  TextFormField(
                    controller: _middleNameController,
                    decoration: InputDecoration(labelText: 'Middle Name'),
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: InputDecoration(labelText: 'Last Name'),
                    validator: (value) => value!.isEmpty ? 'Enter your last name' : null,
                  ),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(labelText: 'Gender'),
                    items: ['Male', 'Female']
                        .map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    validator: (value) => value == null ? 'Select your gender' : null,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email Address'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => value!.isEmpty ? 'Enter your email address' : null,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    validator: (value) => value!.isEmpty ? 'Enter your phone number' : null,
                  ),
                  TextFormField(
                    controller: _countryController,
                    decoration: InputDecoration(labelText: 'Country of Birth'),
                    validator: (value) => value!.isEmpty ? 'Enter your country of birth' : null,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A stateless widget that displays the submitted registration data.
class SummaryPage extends StatelessWidget {
  final String firstName;
  final String middleName;
  final String lastName;
  final String gender;
  final String email;
  final String phone;
  final String country;

  SummaryPage({
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('First Name: $firstName'),
                Text('Middle Name: $middleName'),
                Text('Last Name: $lastName'),
                Text('Gender: $gender'),
                Text('Email: $email'),
                Text('Phone: $phone'),
                Text('Country of Birth: $country'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}