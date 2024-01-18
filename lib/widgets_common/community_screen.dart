import 'package:get/get.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/widgets_common/blog_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightgolden,
        appBar: AppBar(
          backgroundColor: redColor,
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
                        const Color.fromARGB(
                            255, 216, 130, 135)), // Set the background color
                  ),
                  child: "Guidance".text.white.make()),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: 5, // You can adjust the number of blog posts
          itemBuilder: (context, index) {
            return CommunityPostCard(
              imageUrl:
                  'https://placekitten.com/200/200', // Replace with your image URL
              heading: 'Post ${index + 1}',
              subHeading: 'Subtitle of Post ${index + 1}',
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
