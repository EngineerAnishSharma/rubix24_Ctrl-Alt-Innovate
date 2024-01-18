import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tsec_hack/consts/colors.dart';
import 'package:tsec_hack/controller/local_storage.dart';
import 'package:tsec_hack/controller/localization_controller.dart';
import 'package:tsec_hack/views/profile_screen/components/get_information.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (await LocalStorage.getBool("is_english", false)) {
    await Loc.get.initialize(locale: "en");
  } else {
    await Loc.get.initialize(locale: "hi");
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBg-7h5f7toS-IvD7MQRzbHvd7jDi4KOOM",
            authDomain: "tsec-hackathon-61291.firebaseapp.com",
            projectId: "tsec-hackathon-61291",
            storageBucket: "tsec-hackathon-61291.appspot.com",
            messagingSenderId: "543797904930",
            appId: "1:543797904930:web:7c87f73813e2b87ea4ac7b",
            measurementId: "G-FJR687FJPR"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          // set the bar
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
      ),
      home: const ResumeScreen(),
    );
  }
}
