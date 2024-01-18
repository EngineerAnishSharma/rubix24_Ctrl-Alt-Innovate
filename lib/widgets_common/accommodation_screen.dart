import 'package:tsec_hack/consts/consts.dart';

class AccommodationScreen extends StatefulWidget {
  const AccommodationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccommodationScreenState createState() => _AccommodationScreenState();
}

class _AccommodationScreenState extends State<AccommodationScreen> {
  Map<String, List<String>> accommodations = {
    'Musculoskeletal Disabilities': [
      'Adjustable furniture',
      'Ergonomic devices',
      'Specialized equipment',
      'Flexible work schedules',
      'Reduced travel',
      'Accessible parking',
    ],
    'Sensory Disabilities': [
      'Vision Impairment:',
      'Screen readers',
      'Magnification software',
      'Braille displays',
      'Audio descriptions',
      'Accessible documents',
      'Well-lit workspaces',
      'Hearing Impairment:',
      'Sign language interpreters',
      'Real-time captioning',
      'Amplified phones',
      'Visual alerts',
      'Quiet workspaces',
    ],
    'Non-visible Disabilities': [
      'Extended deadlines',
      'Chunked tasks',
      'Written instructions',
      'Different learning styles',
      'Mentoring',
      'Reduced distractions',
    ],
    'Developmental Disabilities': [
      'Clear instructions',
      'Repetitive tasks',
      'Visual aids',
      'Supportive colleagues',
      'Skill development',
      'Positive environment',
    ],
  };

  Map<String, bool> selectedAccommodations = {};
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Accommodation',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: isEditing
                      ? const Icon(Icons.done)
                      : const Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                ),
              ],
            ),
            for (var category in accommodations.keys)
              isEditing
                  ? ExpansionTile(
                      title: Text(category),
                      children: [
                        for (var accommodation in accommodations[category]!)
                          CheckboxListTile(
                            title: Text(accommodation),
                            value:
                                selectedAccommodations[accommodation] ?? false,
                            onChanged: (value) {
                              setState(() {
                                selectedAccommodations[accommodation] = value!;
                              });
                            },
                          ),
                      ],
                    )
                  : Container(),
          ],
        ),
      ),
    );
  }
}
