import 'dart:io';

import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rubix_application/consts/consts.dart';

class ProfileEditor extends StatefulWidget {
  const ProfileEditor({super.key});

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          20.heightBox,
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              imgProfile,
              width: 100,
              fit: BoxFit.cover,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BioSection()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .make(),
                const SizedBox(height: 10),
                const UserDetailsCard(),
                const SizedBox(height: 10),
                const ResumeSection(),
                10.heightBox,
                const SkillsSection(),
                10.heightBox,
                const EducationSection(),
                10.heightBox,
                CareerPreferencesSection(),
                10.heightBox,
                LanguageSection()
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class BioSection extends StatefulWidget {
  const BioSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BioSectionState createState() => _BioSectionState();
}

class _BioSectionState extends State<BioSection> {
  final TextEditingController _bioController = TextEditingController();
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 5),
          _isEditing
              ? TextField(
                  controller: _bioController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Write your bio here...',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                )
              : Text(
                  _bioController.text.isEmpty
                      ? "Write here..."
                      : _bioController.text,
                  style: const TextStyle(fontSize: 16),
                ),
        ],
      ),
    );
  }
}

class UserDetailsCard extends StatefulWidget {
  const UserDetailsCard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UserDetailsCardState createState() => _UserDetailsCardState();
}

class _UserDetailsCardState extends State<UserDetailsCard> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'User Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      _isEditing = !_isEditing;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              enabled: _isEditing,
              decoration: const InputDecoration(labelText: 'Fresher'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: addressController,
              enabled: _isEditing,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              enabled: _isEditing,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              enabled: _isEditing,
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSection extends StatefulWidget {
  const LanguageSection({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LanguageSectionState createState() => _LanguageSectionState();
}

class _LanguageSectionState extends State<LanguageSection> {
  List<Language> languages = [];
  TextEditingController languageController = TextEditingController();
  bool _isEditing = false;

  void addLanguage() {
    String language = languageController.text.trim();
    if (language.isNotEmpty) {
      setState(() {
        languages.add(Language(language, proficiency: Proficiency.Basic));
      });
      languageController.clear();
    }
  }

  void removeLanguage(Language language) {
    setState(() {
      languages.remove(language);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Language Proficiency',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: _isEditing ? Icon(Icons.done) : Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          _isEditing
              ? Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: languageController,
                        decoration:
                            const InputDecoration(labelText: 'Language'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: addLanguage,
                      child: const Text('Add Language'),
                    ),
                  ],
                )
              : Container(),
          const SizedBox(height: 10),
          languages.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: languages.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(languages[index].name),
                          subtitle: Text(
                              'Proficiency: ${languages[index].proficiency.toString().split('.').last}'),
                          trailing: _isEditing
                              ? IconButton(
                                  icon: const Icon(Icons.remove_circle),
                                  onPressed: () =>
                                      removeLanguage(languages[index]),
                                )
                              : null,
                        );
                      },
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

// ignore: constant_identifier_names
enum Proficiency { Basic, Intermediate, Advanced }

class Language {
  final String name;
  final Proficiency proficiency;

  Language(this.name, {this.proficiency = Proficiency.Basic});
}

class EducationSection extends StatefulWidget {
  const EducationSection({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EducationSectionState createState() => _EducationSectionState();
}

class _EducationSectionState extends State<EducationSection> {
  List<Education> educations = [];
  TextEditingController institutionController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  bool _isEditing = false;

  void addEducation() {
    String institution = institutionController.text.trim();
    String degree = degreeController.text.trim();
    String year = yearController.text.trim();

    if (institution.isNotEmpty && degree.isNotEmpty && year.isNotEmpty) {
      setState(() {
        educations.add(Education(institution, degree, year));
      });
      clearTextControllers();
    }
  }

  void removeEducation(Education education) {
    setState(() {
      educations.remove(education);
    });
  }

  void clearTextControllers() {
    institutionController.clear();
    degreeController.clear();
    yearController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Education',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: _isEditing
                    ? const Icon(Icons.done)
                    : const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          _isEditing
              ? Column(
                  children: [
                    TextField(
                      controller: institutionController,
                      decoration:
                          const InputDecoration(labelText: 'Institution'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: degreeController,
                      decoration: const InputDecoration(labelText: 'Degree'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: yearController,
                      decoration: const InputDecoration(labelText: 'Year'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: addEducation,
                      child: const Text('Add Education'),
                    ),
                  ],
                )
              : Container(),
          const SizedBox(height: 20),
          educations.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: educations.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            '${educations[index].degree} in ${educations[index].institution}',
                          ),
                          subtitle: Text('Year: ${educations[index].year}'),
                          trailing: _isEditing
                              ? IconButton(
                                  icon: const Icon(Icons.remove_circle),
                                  onPressed: () =>
                                      removeEducation(educations[index]),
                                )
                              : null,
                        );
                      },
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class Education {
  final String institution;
  final String degree;
  final String year;

  Education(this.institution, this.degree, this.year);
}

class CareerPreferencesSection extends StatefulWidget {
  const CareerPreferencesSection({Key? key}) : super(key: key);

  @override
  _CareerPreferencesSectionState createState() =>
      _CareerPreferencesSectionState();
}

class _CareerPreferencesSectionState extends State<CareerPreferencesSection> {
  String preferredLocation = '';
  double preferredSalary = 0.0;
  String jobType = '';
  String preferredRole = '';
  String preferredShift = '';
  String employmentType = '';

  TextEditingController locationController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController shiftController = TextEditingController();
  TextEditingController employmentTypeController = TextEditingController();

  bool _isEditing = false;

  void savePreferences() {
    setState(() {
      preferredLocation = locationController.text.trim();
      preferredSalary = double.tryParse(salaryController.text.trim()) ?? 0.0;
      jobType = jobTypeController.text.trim();
      preferredRole = roleController.text.trim();
      preferredShift = shiftController.text.trim();
      employmentType = employmentTypeController.text.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Career Preferences',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: _isEditing
                    ? const Icon(Icons.done)
                    : const Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    _isEditing = !_isEditing;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          (_isEditing)
              ? Column(
                  children: [
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                          labelText: 'Preferred Location'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: salaryController,
                      decoration:
                          const InputDecoration(labelText: 'Preferred Salary'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: jobTypeController,
                      decoration: const InputDecoration(labelText: 'Job Type'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: roleController,
                      decoration:
                          const InputDecoration(labelText: 'Preferred Role'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: shiftController,
                      decoration:
                          const InputDecoration(labelText: 'Preferred Shift'),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: employmentTypeController,
                      decoration:
                          const InputDecoration(labelText: 'Employment Type'),
                    ),
                    const SizedBox(height: 20),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}

class ResumeSection extends StatefulWidget {
  const ResumeSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResumeSectionState createState() => _ResumeSectionState();
}

class _ResumeSectionState extends State<ResumeSection> {
  String _filePath = '';
  late PDFDocument _pdfDocument;

  Future<void> _pickAndOpenPDFFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        setState(() {
          _filePath = result.files.single.path!;
        });

        // Load the PDF document
        _pdfDocument = await PDFDocument.fromFile(File(_filePath));
      }
    } catch (e) {
      print('Error picking PDF file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Attach Resume (PDF)',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _pickAndOpenPDFFile,
          child: const Text('Attach PDF'),
        ),
        const SizedBox(height: 10),
        _filePath.isNotEmpty
            ? Expanded(
                child: PDFViewer(
                  document: _pdfDocument,
                ),
              )
            : Container(),
      ],
    );
  }
}

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SkillsSectionState createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  List<String> skills = [];

  TextEditingController skillController = TextEditingController();

  void addSkill() {
    String skill = skillController.text.trim();
    if (skill.isNotEmpty && !skills.contains(skill)) {
      setState(() {
        skills.add(skill);
      });
      skillController.clear();
    }
  }

  void removeSkill(String skill) {
    setState(() {
      skills.remove(skill);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key Skills',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: skillController,
                  decoration: const InputDecoration(labelText: 'Enter Skill'),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: addSkill,
                child: const Text('Add'),
              ),
            ],
          ),
          const SizedBox(height: 10),
          skills.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: skills.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(skills[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle),
                            onPressed: () => removeSkill(skills[index]),
                          ),
                        );
                      },
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
