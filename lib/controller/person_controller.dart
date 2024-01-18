import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tsec_hack/consts/firebase_const.dart';

class PersonController extends GetxController {
  static Future<void> setUserLanguage(List<String> language) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'language': language,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserPost(String post) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'post': post,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserLocation(String location) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'location': location,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserDisabilityType(String disabilityType) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'disabled_inclusive': disabilityType,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }
  static Future<void> setUserSkills(List<String> skills) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'skills': skills,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }

  static Future<void> setUserPerks(List<String> perks) {
    return firestore.collection(userCollection).doc(currentUser!.uid).set({
      'perks': perks,
    }, SetOptions(merge: true)); // Use SetOptions to merge with existing data
  }
}
