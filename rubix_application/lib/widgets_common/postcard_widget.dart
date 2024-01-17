import 'package:rubix_application/consts/consts.dart';

class PostCard extends StatefulWidget {
  final String profilePicture;
  final String userName;
  final String content;
  final String postimage;
  final int likes;

  const PostCard(
      {required this.profilePicture,
      required this.userName,
      required this.content,
      required this.postimage,
      required this.likes,
      super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool readmore = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 515,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color(0xffB4D4FF),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black, // Optional border color
                      width: 2.5, // Optional border width
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      widget.profilePicture,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    widget.userName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff3468C0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 30,
                      margin: EdgeInsets.only(left: 100),
                      child: const Image(
                          image: AssetImage('assets/images/addfriend.png'))),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.content),
                  Container(
                    child: Text(
                      readmore ? 'Read less' : 'Read more',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Optional border color
                  width: 2.5, // Optional border width
                ),
              ),
              child: Image.network(
                widget.postimage,
                fit: BoxFit.cover,
              ),
            ),
            GestureDetector(
              onTap: () {
                // widget.likes = widget.likes + 1;
              },
              child: Row(
                children: [
                  Container(
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      child: const Image(
                          image: AssetImage('assets/images/like.png'))),
                  Text(
                    widget.likes.toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
