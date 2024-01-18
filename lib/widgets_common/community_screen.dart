import 'package:get/get.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/widgets_common/blog_screen.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  // final String apiUrl = 'https://96b5-110-172-23-161.ngrok-free.app/';

  // Future<List<Map<String, dynamic>>> getRecommendations(
  //     String location,
  //     String language,
  //     String disability,
  //     String jobPreference,
  //     String perks) async {
  //   String userProfile =
  //       "$location%20$language%20$jobPreference%20$disability%20$perks";

  //   final response = await http.get(
  //     Uri.parse('$apiUrl?user_profle=$userProfile'),
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // If server returns an OK response, parse the JSON
  //     List<dynamic> data = json.decode(response.body)['data'];
  //     List<Map<String, dynamic>> recommendations =
  //         List<Map<String, dynamic>>.from(data);
  //     // print(recommendations);
  //     return recommendations;
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // throw an exception.
  //     throw Exception('Failed to load recommendations');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightgolden,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 110, 80, 243),
          title: const Text(
            'Community',
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  onPressed: () {
                    Get.to((() => const BlogScreen()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue), // Set the background color
                  ),
                  child: "Guidance".text.white.make()),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return const CommunityPostCard(
              imageUrl: 'https://placekitten.com/200/200',
              heading: "post1",
              subHeading: "subpost",
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
          ),
        ));
  }
}

class CommunityPostCard extends StatelessWidget {
  final String imageUrl;
  final String heading;
  final String subHeading;

  const CommunityPostCard({
    super.key,
    required this.imageUrl,
    required this.heading,
    required this.subHeading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subHeading,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  // Handle like button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {
                  // Handle comment button press
                },
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // Handle share button press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
