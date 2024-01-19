import 'package:tsec_hack/consts/consts.dart';

class PostCard extends StatefulWidget {
  final String profilePicture;
  final String userName;
  final String content;
  final String postimage;
  final int likes;

  const PostCard({
    required this.profilePicture,
    required this.userName,
    required this.content,
    required this.postimage,
    required this.likes,
    Key? key,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool readmore = false;
  bool isFriend = false;
  int localLikes = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
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
                  onTap: () {
                    // Toggle friend status when the user taps the add friend image
                    setState(() {
                      isFriend = !isFriend;
                    });
                  },
                  child: Container(
                    width: 30,
                    margin: const EdgeInsets.only(left: 140),
                    child: isFriend
                        ? const Icon(Icons.check, color: Colors.green)
                        : const Image(
                            image: AssetImage('assets/images/addfriend.png'),
                          ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    readmore ? widget.content : widget.content.substring(0, 80),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        readmore = !readmore;
                      });
                    },
                    child: Container(
                      child: Text(
                        readmore ? 'Read less' : 'Read more',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
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
                // Increment widget.likes when the user taps the like button
                setState(() {
                  localLikes++;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    child: const Image(
                      image: AssetImage('assets/images/like.png'),
                    ),
                  ),
                  Text(
                    (widget.likes + localLikes).toString(),
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
