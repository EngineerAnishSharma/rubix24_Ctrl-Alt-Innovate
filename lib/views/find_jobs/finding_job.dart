import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/controller/recommendation_system.dart';
import 'package:tsec_hack/services/firestore_services.dart';
import 'package:tsec_hack/widgets_common/jobcard_widget.dart';

class FindingJobScreen extends StatefulWidget {
  const FindingJobScreen({super.key});

  @override
  State<FindingJobScreen> createState() => _FindingJobScreenState();
}

class _FindingJobScreenState extends State<FindingJobScreen> {
  RecommendationSystem recommendationSystem = RecommendationSystem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: StreamBuilder(
        stream: FirestoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            var data = snapshot.data!.docs[0];
            return FutureBuilder(
              future: recommendationSystem.getRecommendations(
                data['location'],
                data['language'][0],
                data['disabled_inclusive'],
                data['post'],
                data['perks'][0],
              ),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, dynamic>>>
                      recommendationsSnapshot) {
                if (recommendationsSnapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  );
                } else if (recommendationsSnapshot.hasError) {
                  return Center(
                    child: Text('Error: ${recommendationsSnapshot.error}'),
                  );
                } else {
                  var recommendations = recommendationsSnapshot.data ?? [];
                  print(recommendations); // Print the recommendations

                  // Build your UI based on the recommendations
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        30.heightBox,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            color: lightGrey,
                            child: TextFormField(
                              // controller: ,
                              // controller: _textEditingController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffixIcon: const Icon(Icons.search).onTap(() {
                                  // _onPracticePressed();
                                }),
                                filled: true,
                                fillColor: whiteColor,
                                hintText: "Search Job",
                                hintStyle:
                                    const TextStyle(color: textfieldGrey),
                              ),
                            ),
                          ),
                        ),
                        const JobCard(
                          companyLogo: "https://placekitten.com/200/200",
                          companyName: 'Engineers',
                          jobPosition: 'Software developer',
                          location: 'Mumbai',
                          jobType: 'abcsde',
                          salary: '45000',
                          applicants: '34',
                        ),
                        const JobCard(
                          companyLogo: "https://placekitten.com/200/200",
                          companyName: 'Engineers',
                          jobPosition: 'Software developer',
                          location: 'Mumbai',
                          jobType: 'abcsde',
                          salary: '45000',
                          applicants: '34',
                        ),
                        const JobCard(
                          companyLogo: "https://placekitten.com/200/200",
                          companyName: 'Engineers',
                          jobPosition: 'Software developer',
                          location: 'Mumbai',
                          jobType: 'abcsde',
                          salary: '45000',
                          applicants: '34',
                        ),
                        const JobCard(
                          companyLogo: "https://placekitten.com/200/200",
                          companyName: 'Engineers',
                          jobPosition: 'Software developer',
                          location: 'Mumbai',
                          jobType: 'abcsde',
                          salary: '45000',
                          applicants: '34',
                        ),
                      ],
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
