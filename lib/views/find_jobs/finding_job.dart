import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/widgets_common/jobcard_widget.dart';

class FindingJobScreen extends StatefulWidget {
  const FindingJobScreen({super.key});

  @override
  State<FindingJobScreen> createState() => _FindingJobScreenState();
}

class _FindingJobScreenState extends State<FindingJobScreen> {
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
