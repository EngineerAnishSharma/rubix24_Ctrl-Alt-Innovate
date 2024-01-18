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
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          JobCard(
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
