import 'package:get/get.dart';
import 'package:tsec_hack/consts/consts.dart';

class JobApplicationForm extends StatefulWidget {
  const JobApplicationForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JobApplicationFormState createState() => _JobApplicationFormState();
}

class _JobApplicationFormState extends State<JobApplicationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _name = '';
  // ignore: unused_field
  String _email = '';
  // ignore: unused_field
  String _phone = '';
  // ignore: unused_field
  String _coverLetter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Job Application Form',
          style: TextStyle(color: fontGrey),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildFormField('Full Name', (value) => _name = value),
              _buildFormField('Email', (value) => _email = value,
                  keyboardType: TextInputType.emailAddress),
              _buildFormField('Phone Number', (value) => _phone = value,
                  keyboardType: TextInputType.phone),
              _buildFormField('Cover Letter', (value) => _coverLetter = value,
                  maxLines: 2),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit Application'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, void Function(String) onSaved,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Now you can use the captured data for further processing
      // print('Name: $_name');
      // print('Email: $_email');
      // print('Phone: $_phone');
      // print('Cover Letter: $_coverLetter');
    }
    Get.back();
  }
}
