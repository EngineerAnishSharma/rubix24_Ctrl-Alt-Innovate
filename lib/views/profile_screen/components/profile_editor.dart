import 'package:confetti/confetti.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/controller/auth_controller.dart';
import 'package:tsec_hack/controller/local_storage.dart';
import 'package:tsec_hack/controller/localization_controller.dart';
import 'package:tsec_hack/controller/person_controller.dart';
import 'package:tsec_hack/views/auth_screen/login_screen.dart';
import 'package:tsec_hack/views/profile_screen/components/get_information.dart';
import 'package:tsec_hack/widgets_common/accessiblity_change_dialog.dart';
import 'package:tsec_hack/widgets_common/accommodation_screen.dart';
import 'package:tsec_hack/widgets_common/language_change_dialog.dart';
import 'package:tsec_hack/widgets_common/our_button.dart';

class ProfileEditor extends StatefulWidget {
  const ProfileEditor({super.key});

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  var name = "";
  @override
  Widget build(BuildContext context) {
    bool isEnglish = false;
    bool isBlind = false;
    LocalStorage.getBool("is_english", false)
        .then((value) => isEnglish = value);
    LocalStorage.getBool("is_blind", false).then((value) => isBlind = value);
    var controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 210, 241),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          40.heightBox,
          // ConfettiWidget(
          //   confettiController: _confettiController,
          //   blastDirectionality: BlastDirectionality.explosive,
          //   shouldLoop: false,
          //   colors: const [Colors.blue, Colors.red, Colors.green],
          // ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                imgProfile2,
                width: 150,
                fit: BoxFit.cover,
              ).box.roundedFull.clip(Clip.antiAlias).make(),
            ),
          ),
          Text(name.isEmptyOrNull ? name : ""),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const BioSection()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .make(),
                const SizedBox(height: 10),
                const UserDetailsCard()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .make(),
                const SizedBox(height: 10),
                const ResumeSection()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .padding(const EdgeInsets.all(8.0))
                    .make(),
                10.heightBox,
                const SkillsSection()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .make(),
                10.heightBox,
                const EducationSection()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .make(),
                10.heightBox,
                const CareerPreferencesSection()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .padding(const EdgeInsets.all(8.0))
                    .make(),
                10.heightBox,
                const LanguageSection()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .padding(const EdgeInsets.all(8.0))
                    .make(),
                10.heightBox,
                const AccommodationScreen()
                    .box
                    .rounded
                    .clip(Clip.antiAlias)
                    .shadowOutline()
                    .padding(const EdgeInsets.all(8.0))
                    .make(),
                10.heightBox,
                ourButton(
                    onPress: () {
                      Get.to(() => const ResumeScreen());
                    },
                    textColor: whiteColor,
                    color1: Colors.blue,
                    title: "Save"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        Loc.get["profile_english"],
                        style: GoogleFonts.aBeeZee(
                            fontSize: 16, color: Colors.black),
                      ),
                      Switch(
                        value: isEnglish,
                        activeColor: const Color(0xff1db4fb),
                        onChanged: (value) async {
                          Get.to(() => languageDialog(context));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        Loc.get["accessiblity_english"],
                        style: GoogleFonts.aBeeZee(
                            fontSize: 16, color: Colors.black),
                      ),
                      Switch(
                        value: isBlind,
                        activeColor: const Color(0xff1db4fb),
                        onChanged: (value) async {
                          Get.to(() => AccessiblityDialog(context));
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                      color: Colors.black,
                    )),
                    onPressed: () async {
                      await controller.signoutMethod(context);
                      _confettiController.play();
                      Future.delayed(const Duration(seconds: 5), () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      });
                    },
                    // onPressed: () async {
                    //   await controller.signoutMethod(context);
                    //   // ignore: use_build_context_synchronously
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const LoginScreen()),
                    //   );
                    // },
                    child: logout.text.black.fontFamily(semibold).make(),
                  ),
                ),
              ),
            ],
          ),
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
    return Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bio',
                style: GoogleFonts.aBeeZee(fontSize: 20),
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
          const SizedBox(height: 5),
          _isEditing
              ? TextField(
                  controller: _bioController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Write your bio here...',
                    hintStyle: GoogleFonts.aBeeZee(fontSize: 14),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: const OutlineInputBorder(
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
                  style: GoogleFonts.aBeeZee(fontSize: 16),
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
  final TextEditingController nameController1 = TextEditingController();
  final TextEditingController postController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool _isEditing = false;
  var controller1 = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 177, 210, 241),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User Details',
                  style: GoogleFonts.aBeeZee(
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
                      PersonController.setUserPost(
                          postController.text.toString());
                      PersonController.setUserLocation(
                          addressController.text.toString());
                    });
                  },
                ),
              ],
            ),
            TextField(
              controller: nameController1,
              enabled: _isEditing,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: postController,
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
  List<String> lang = [];
  TextEditingController languageController = TextEditingController();
  bool _isEditing = false;

  void addLanguage() {
    String language = languageController.text.trim();
    if (language.isNotEmpty) {
      setState(() {
        languages.add(Language(language, proficiency: Proficiency.Basic));
        lang.add(language);
      });
      languageController.clear();
    }
  }

  void removeLanguage(Language language) {
    setState(() {
      languages.remove(language);
      lang.remove(language.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Language Proficiency',
                style: GoogleFonts.aBeeZee(
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
                    PersonController.setUserLanguage(lang);
                  });
                },
              ),
            ],
          ),
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
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Education',
                style: GoogleFonts.aBeeZee(
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
  // ignore: library_private_types_in_public_api
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
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Career Preferences',
                style: GoogleFonts.aBeeZee(
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
          (_isEditing)
              ? Column(
                  children: [
                    TextField(
                      controller: locationController,
                      decoration: const InputDecoration(
                          labelText: 'Preferred Location'),
                    ),
                    TextField(
                      controller: salaryController,
                      decoration:
                          const InputDecoration(labelText: 'Preferred Salary'),
                      keyboardType: TextInputType.number,
                    ),
                    TextField(
                      controller: jobTypeController,
                      decoration: const InputDecoration(labelText: 'Job Type'),
                    ),
                    TextField(
                      controller: roleController,
                      decoration:
                          const InputDecoration(labelText: 'Preferred Role'),
                    ),
                    TextField(
                      controller: shiftController,
                      decoration:
                          const InputDecoration(labelText: 'Preferred Shift'),
                    ),
                    TextField(
                      controller: employmentTypeController,
                      decoration:
                          const InputDecoration(labelText: 'Employment Type'),
                    ),
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
  // late PDFDocument _pdfDocument;

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
        // _pdfDocument = await PDFDocument.fromFile(File(_filePath));
      }
    } catch (e) {
      print('Error picking PDF file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Attach Resume (PDF)',
            style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: _pickAndOpenPDFFile,
            child: const Text('Attach PDF'),
          ),
          // _filePath.isNotEmpty
          //     ? Expanded(
          //         child: PDFViewer(
          //           document: _pdfDocument,
          //         ),
          //       )
          //     : Container(),
        ],
      ),
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
        PersonController.setUserSkills(skills);
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
    return Container(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, top: 8, bottom: 8),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Skills',
            style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
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
