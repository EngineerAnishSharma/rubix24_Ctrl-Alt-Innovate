import 'package:flutter/material.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/controller/person_controller.dart';

class AccommodationScreen extends StatefulWidget {
  const AccommodationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccommodationScreenState createState() => _AccommodationScreenState();
}

class _AccommodationScreenState extends State<AccommodationScreen> {
  Map<String, List<String>> accommodations = {
    'Musculoskeletal Disabilities': [
      'Flexible work schedules',
      'Reduced travel',
      'Accessible parking',
    ],
    'Sensory Disabilities': [
      'Screen readers',
      'Braille displays',
      'Sign language interpreters',
      'Real-time captioning',
    ],
    'Non-visible Disabilities': [
      'Extended deadlines',
      'Mentoring',
    ],
    'Developmental Disabilities': [
      'Visual aids',
      'Supportive colleagues',
    ],
  };

  Map<String, bool> selectedAccommodations = {};
  List<String> selectedAccommodationsList = [];
  String selectedCategory = "";
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Disability & Accommodation',
                  style: TextStyle(
                    fontSize: 18,
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
                      if (!isEditing) {
                        // If editing is done, reset the selections
                        selectedAccommodationsList.clear();
                        selectedCategory = "";
                      }
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
                                if (value!) {
                                  selectedAccommodationsList.add(accommodation);
                                  selectedCategory = category;
                                } else {
                                  selectedAccommodationsList
                                      .remove(accommodation);
                                  if (selectedAccommodationsList.isEmpty) {
                                    selectedCategory = "";
                                  }
                                }
                              });
                              PersonController.setUserPerks(
                                  selectedAccommodationsList);
                              PersonController.setUserDisabilityType(
                                  selectedCategory);
                            },
                          ),
                      ],
                    )
                  : Container(),
            if (!isEditing && selectedCategory.isNotEmpty)
              Column(
                children: [
                  Text(
                    'Selected Category: $selectedCategory',
                    style: const TextStyle(fontSize: 16),
                  ),
                  for (var entry in selectedAccommodationsList)
                    Text(
                      entry,
                      style: const TextStyle(fontSize: 16),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

// import 'package:tsec_hack/consts/consts.dart';

// class AccommodationScreen extends StatefulWidget {
//   const AccommodationScreen({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _AccommodationScreenState createState() => _AccommodationScreenState();
// }

// class _AccommodationScreenState extends State<AccommodationScreen> {
//   Map<String, List<String>> accommodations = {
//     'Musculoskeletal Disabilities': [
//       'Flexible work schedules',
//       'Reduced travel',
//       'Accessible parking',
//     ],
//     'Sensory Disabilities': [
//       'Screen readers',
//       'Braille displays',
//       'Sign language interpreters',
//       'Real-time captioning',
//     ],
//     'Non-visible Disabilities': [
//       'Extended deadlines',
//       'Mentoring',
//     ],
//     'Developmental Disabilities': [
//       'Visual aids',
//       'Supportive colleagues',
    
//     ],
//   };

//   Map<String, bool> selectedAccommodations = {};
//   bool isEditing = false;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Disability & Accommodation',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 IconButton(
//                   icon: isEditing
//                       ? const Icon(Icons.done)
//                       : const Icon(Icons.edit),
//                   onPressed: () {
//                     setState(() {
//                       isEditing = !isEditing;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             for (var category in accommodations.keys)
//               isEditing
//                   ? ExpansionTile(
//                       title: Text(category),
//                       children: [
//                         for (var accommodation in accommodations[category]!)
//                           CheckboxListTile(
//                             title: Text(accommodation),
//                             value:
//                                 selectedAccommodations[accommodation] ?? false,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedAccommodations[accommodation] = value!;
//                               });
//                             },
//                           ),
//                       ],
//                     )
//                   : Container(),
//             if (!isEditing)
//               Column(
//                 children: [
//                   for (var entry in selectedAccommodations.entries)
//                     Text(
//                       '${entry.key}: ${entry.value}',
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
