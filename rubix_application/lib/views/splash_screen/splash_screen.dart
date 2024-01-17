import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rubix_application/consts/consts.dart';
import 'package:rubix_application/home.dart';
import 'package:rubix_application/views/auth_screen/login_screen.dart';
import 'package:rubix_application/widgets_common/applogo_widget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  //creating a method to changing the screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      //getX
      // Get.to(()=>const LoginScreen());
      auth.authStateChanges().listen((User? user) {
        if(user==null && mounted){
          Get.to( const LoginScreen());
        }else{
          Get.to( const Home());
        }
      });
    });
  }
  @override
  void initState() {
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
                child: Image.asset(icSplashBg,width: 300,)
            ),
            const SizedBox(height: 20,),
            applogoWidget(),
            const SizedBox(height: 10,),
            appname.text.fontFamily(bold).size(22).white.make(),//Text
            const SizedBox(height: 5,),
            appversion.text.white.make(),
            const Spacer(),//takes max space
            credits.text.fontFamily(semibold).white.make(),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
