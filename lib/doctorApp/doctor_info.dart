import 'package:get/get.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/views/auth_screen/login_screen.dart';

class DoctorInfo extends StatefulWidget {
  final String email;
  final String username;
  const DoctorInfo({Key? key, required this.email, required this.username})
      : super(key: key);
  @override
  State<DoctorInfo> createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  List<Map<String, dynamic>> patients = [
    {
      'id': 'P001',
      'name': 'John Doe',
      'age': 30,
      'disability': 'None',
    },
    {
      'id': 'P002',
      'name': 'Jane Smith',
      'age': 25,
      'disability': 'Vision impairment',
    },
    {
      'id': 'P003',
      'name': 'Alice Johnson',
      'age': 40,
      'disability': 'Hearing loss',
    },
    {
      'id': 'P004',
      'name': 'Bob Miller',
      'age': 35,
      'disability': 'Mobility impairment',
    },
    // Add more patients as needed
  ];

  // Add more patients as needed

  void _showPatientDetails(BuildContext context, Map<String, dynamic> patient) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${patient['id']}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              Text('Name: ${patient['name']}'),
              Text('Age: ${patient['age']}'),
              Text('Disability: ${patient['disability']}'),

              // Add other patient details as needed
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        width: double.infinity,
        height: 530,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 212, 97, 232), Colors.deepPurple],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            //edit
            30.heightBox,
            //profile setting
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    child: Image.asset(
                      imgProfile,
                      width: 80,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.username.text
                              .fontFamily(semibold)
                              .white
                              .make(),
                          widget.email.text.white.fontFamily(semibold).make(),
                          "Id:1234567"
                              .text
                              .white
                              .fontWeight(FontWeight.bold)
                              .make()
                        ],
                      ),
                    ),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                      color: whiteColor,
                    )),
                    onPressed: () async {
                      Get.offAll(() => const LoginScreen());
                    },
                    child: logout.text.white.fontFamily(semibold).make(),
                  )
                ],
              ),
            ),
            10.heightBox,

            "Employee".text.size(20).white.make(),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  var patient = patients[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: ListTile(
                      title: Text('ID: ${patient['id']}'),
                      subtitle: Text('Name: ${patient['name']}'),
                      onTap: () {
                        _showPatientDetails(context, patient);
                        // Handle the tap on a patient item
                        // print('Tapped on ${patient['name']}');
                        // You can navigate to another screen or perform other actions here
                      },
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
