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
        child: Column(children: [
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
            jobType: 'Unknwon',
            salary: '45000',
            applicants: '34',
          ),
          const JobCard(
            companyLogo: "https://placekitten.com/200/200",
            companyName: 'Capital',
            jobPosition: 'Software developer',
            location: 'Delhi',
            jobType: 'Unknwon',
            salary: '45000',
            applicants: '44',
          ),
          const JobCard(
            companyLogo: "https://placekitten.com/200/200",
            companyName: 'Tesla',
            jobPosition: 'Software developer',
            location: 'Jaipur',
            jobType: 'Unknwon',
            salary: '45000',
            applicants: '54',
          ),
        ]),
      ),
    );
  }
}


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tsec_hack/consts/consts.dart';
// import 'package:tsec_hack/services/firestore_services.dart';
// import 'package:tsec_hack/widgets_common/jobcard_widget.dart';

// import 'dart:convert';
// import 'package:http/http.dart' as http;

// // class RecommendationSystem {
// //   final String apiUrl = 'https://96b5-110-172-23-161.ngrok-free.app/';

// //   Future<List<Map<String, dynamic>>> getRecommendations(
// //       String location,
// //       String language,
// //       String disability,
// //       String jobPreference,
// //       String perks) async {
// //     String userProfile =
// //         "$location%20$language%20$jobPreference%20$disability%20$perks";

// //     final response = await http.get(
// //       Uri.parse('$apiUrl?user_profle=$userProfile'),
// //       headers: {
// //         'Content-Type': 'application/json',
// //       },
// //     );

// //     if (response.statusCode == 200) {
// //       // If server returns an OK response, parse the JSON
// //       List<dynamic> data = json.decode(response.body)['data'];
// //       List<Map<String, dynamic>> recommendations =
// //           List<Map<String, dynamic>>.from(data);
// //       return recommendations;
// //     } else {
// //       // If the server did not return a 200 OK response,
// //       // throw an exception.
// //       throw Exception('Failed to load recommendations');
// //     }
// //   }
// // }
// class FindingJobScreen extends StatefulWidget {
//   final String apiUrl = 'https://16a2-110-172-23-161.ngrok-free.app/';

//   Future<List<Map<String, dynamic>>> getRecommendations(
//       String location,
//       String language,
//       String disability,
//       String jobPreference,
//       String perks) async {
//     String userProfile =
//         "$location%20$language%20$jobPreference%20$disability%20$perks";

//     final response = await http.get(
//       Uri.parse('$apiUrl?user_profle=$userProfile'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//     );

//     if (response.statusCode == 200) {
//       // If server returns an OK response, parse the JSON
//       List<dynamic> data = json.decode(response.body)['data'];
//       List<Map<String, dynamic>> recommendations =
//           List<Map<String, dynamic>>.from(data);
//       return recommendations;
//     } else {
//       // If the server did not return a 200 OK response,
//       // throw an exception.
//       throw Exception('Failed to load recommendations');
//     }
//   }

//   const FindingJobScreen({super.key});

//   @override
//   State<FindingJobScreen> createState() => _FindingJobScreenState();
// }

// class _FindingJobScreenState extends State<FindingJobScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: lightGrey,
//       body: StreamBuilder(
//         stream: FirestoreServices.getUser(currentUser!.uid),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(
//                 valueColor: AlwaysStoppedAnimation(redColor),
//               ),
//             );
//           } else {
//             var data = snapshot.data!.docs[0];
//             return FutureBuilder(
//               future: widget.getRecommendations(
//                 data['location'],
//                 data['language'][0],
//                 data['disabled_inclusive'],
//                 data['post'],
//                 data['perks'][0],
//               ),
//               builder: (BuildContext context,
//                   AsyncSnapshot<List<Map<String, dynamic>>>
//                       recommendationsSnapshot) {
//                 // if (recommendationsSnapshot.connectionState ==
//                 //     ConnectionState.waiting) {
//                 //   return const Center(
//                 //     child: CircularProgressIndicator(
//                 //       valueColor: AlwaysStoppedAnimation(redColor),
//                 //     ),
//                 //   );
//                 // } 
//                 if (recommendationsSnapshot.hasError) {
//                   return Center(
//                     child: Text('Error: ${recommendationsSnapshot.error}'),
//                   );
//                 } else {
//                   var recommendations = recommendationsSnapshot.data ?? [];
//                   print(recommendations); // Print the recommendations

//                   // Build your UI based on the recommendations
//                   return SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         30.heightBox,
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 60,
//                             color: lightGrey,
//                             child: TextFormField(
//                               // controller: ,
//                               // controller: _textEditingController,
//                               decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 suffixIcon: const Icon(Icons.search).onTap(() {
//                                   // _onPracticePressed();
//                                 }),
//                                 filled: true,
//                                 fillColor: whiteColor,
//                                 hintText: "Search Job",
//                                 hintStyle:
//                                     const TextStyle(color: textfieldGrey),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const JobCard(
//                           companyLogo: "https://placekitten.com/200/200",
//                           companyName: 'Engineers',
//                           jobPosition: 'Software developer',
//                           location: 'Mumbai',
//                           jobType: 'abcsde',
//                           salary: '45000',
//                           applicants: '34',
//                         ),
//                         const JobCard(
//                           companyLogo: "https://placekitten.com/200/200",
//                           companyName: 'Engineers',
//                           jobPosition: 'Software developer',
//                           location: 'Mumbai',
//                           jobType: 'abcsde',
//                           salary: '45000',
//                           applicants: '34',
//                         ),
//                         const JobCard(
//                           companyLogo: "https://placekitten.com/200/200",
//                           companyName: 'Engineers',
//                           jobPosition: 'Software developer',
//                           location: 'Mumbai',
//                           jobType: 'abcsde',
//                           salary: '45000',
//                           applicants: '34',
//                         ),
//                         const JobCard(
//                           companyLogo: "https://placekitten.com/200/200",
//                           companyName: 'Engineers',
//                           jobPosition: 'Software developer',
//                           location: 'Mumbai',
//                           jobType: 'abcsde',
//                           salary: '45000',
//                           applicants: '34',
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
