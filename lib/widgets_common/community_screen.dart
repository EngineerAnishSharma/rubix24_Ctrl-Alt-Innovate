import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/services/firestore_services.dart';
import 'package:tsec_hack/widgets_common/blog_screen.dart';
import 'package:tsec_hack/widgets_common/postcard_widget.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  // Define a list of postcards data
  final List<PostCardData> postcards = [
    PostCardData(
      profilePicture:
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      userName: "User1",
      content:
          "Lorem Ipsum is a placeholder text commonly used in the printing and typesetting industry. It doesn't carry any meaningful content but is often used to fill space in a document and give an impression of how the final text will look.",
      postimage:
          "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg",
      likes: 10,
    ),
    PostCardData(
      profilePicture:
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      userName: "User1",
      content:
          "Lorem Ipsum is a placeholder text commonly used in the printing and typesetting industry. It doesn't carry any meaningful content but is often used to fill space in a document and give an impression of how the final text will look.",
      postimage:
          "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg",
      likes: 10,
    ),
    PostCardData(
      profilePicture:
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      userName: "User1",
      content:
          "Lorem Ipsum is a placeholder text commonly used in the printing and typesetting industry. It doesn't carry any meaningful content but is often used to fill space in a document and give an impression of how the final text will look.",
      postimage:
          "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg",
      likes: 10,
    ),
    PostCardData(
      profilePicture:
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
      userName: "User1",
      content:
          "Lorem Ipsum is a placeholder text commonly used in the printing and typesetting industry. It doesn't carry any meaningful content but is often used to fill space in a document and give an impression of how the final text will look.",
      postimage:
          "https://hips.hearstapps.com/hmg-prod/images/close-up-of-tulips-blooming-in-field-royalty-free-image-1584131603.jpg",
      likes: 10,
    ),
    // Add more postcard data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightgolden,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 110, 80, 243),
          title: const Text('Community'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const BlogScreen());
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: "Guidance".text.white.make(),
              ),
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getPost(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('No data available'),
              );
            } else {
              List<PostCardData> postcards = snapshot.data!.docs.map((doc) {
                return PostCardData(
                    profilePicture: doc['image_url'],
                    userName: doc['name'],
                    content: doc['content'],
                    postimage: doc['post_url'],
                    likes: int.parse(doc['likes'] ?? '0'));
              }).toList();

              return ListView.builder(
                shrinkWrap: true,
                itemCount: postcards.length,
                itemBuilder: (context, index) {
                  return PostCard(
                    profilePicture: "https://placekitten.com/200/200",
                    userName: postcards[index].userName,
                    content: postcards[index].content,
                    postimage: "https://placekitten.com/200/200",
                    likes: postcards[index].likes,
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// Data class to represent postcard information
class PostCardData {
  final String profilePicture;
  final String userName;
  final String content;
  final String postimage;
  final int likes;

  PostCardData({
    required this.profilePicture,
    required this.userName,
    required this.content,
    required this.postimage,
    required this.likes,
  });
}
