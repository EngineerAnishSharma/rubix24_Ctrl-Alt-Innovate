import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/controller/localization_controller.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Blog',
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          BlogPost(
            imageUrl: 'https://placekitten.com/200/200',
            heading: 'Sample Blog Post 1',
            subHeading: 'Subtitle of the first blog post',
          ),
          BlogPost(
            imageUrl: 'https://placekitten.com/200/201',
            heading: 'Sample Blog Post 2',
            subHeading: 'Subtitle of the second blog post',
          ),

          // Add more BlogPost widgets as needed
          MeetingCard(),
          MeetingCard()
        ],
      ),
    );
  }
}

class BlogPost extends StatelessWidget {
  final String imageUrl;
  final String heading;
  final String subHeading;

  const BlogPost({
    super.key,
    required this.imageUrl,
    required this.heading,
    required this.subHeading,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading,
                  style: const TextStyle(
                    fontSize: 18,
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
        ],
      ),
    );
  }
}

class MeetingCard extends StatelessWidget {
  const MeetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Loc.get['meeting_details'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(
                  'Date:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('January 25, 2024'),
              ),
              ListTile(
                title: Text(
                  'Time:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('3:00 PM - 4:00 PM'),
              ),
              ListTile(
                title: Text(
                  'Topic:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(Loc.get['topic']),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
