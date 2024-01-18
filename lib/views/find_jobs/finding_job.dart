import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/controller/recommendation_system.dart';
import 'package:tsec_hack/widgets_common/jobcard_widget.dart';

class FindingJobScreen extends StatefulWidget {
  const FindingJobScreen({super.key});

  @override
  State<FindingJobScreen> createState() => _FindingJobScreenState();
}

class _FindingJobScreenState extends State<FindingJobScreen> {
  RecommendationSystem recommendationSystem = RecommendationSystem();
  @override
  void initState() {
    super.initState();
    // Call the getRecommendations method when the screen initializes
    _fetchRecommendations();
  }

  Future<void> _fetchRecommendations() async {
    try {
      List<Map<String, dynamic>> recommendations =
          await recommendationSystem.getRecommendations(
        'mumbai',
        'english',
        'software',
        'visual',
        'mentoring',
      );
      // Do something with the recommendations
      print(recommendations);
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrey,
        body: SingleChildScrollView(
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
                      hintStyle: const TextStyle(color: textfieldGrey),
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
        ));
  }
}
