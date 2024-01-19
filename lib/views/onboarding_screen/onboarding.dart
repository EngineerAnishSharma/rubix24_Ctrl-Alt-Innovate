import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/controller/localization_controller.dart';
import 'package:tsec_hack/views/home_screen/home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _TestState();
}

class _TestState extends State<Onboarding> {
  final PageController _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/onboarding1.png',
                    height: 350,
                    width: 350,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      Loc.get['o1'],
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ).text.white.make(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("", style: GoogleFonts.lato()),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/onboarding2.png',
                    height: 350,
                    width: 350,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      Loc.get['o2'],
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ).text.white.make(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(Loc.get['o2_2'], style: GoogleFonts.lato())
                      .text
                      .white
                      .make(),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/onboarding3.png',
                    height: 350,
                    width: 350,
                  ),
                  Text(
                    Loc.get['o3'],
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ).text.white.make(),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    Loc.get['o3_2'],
                    style: GoogleFonts.lato(),
                  ).text.white.make(),
                ],
              ),
            ],
          ),
          Positioned(
            // alignment: Alignment.center,
            bottom: 60,
            left: MediaQuery.of(context).size.width * 0.5 - 32,
            child: const Column(
              children: [
                SizedBox(height: 24),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(
                  flex: 1,
                ),
                AnimatedSmoothIndicator(
                  activeIndex: currentPage.round(),
                  count: 3,
                  effect: const WormEffect(
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.indigo),
                ),
                const Spacer(
                  flex: 5,
                ),
                MaterialButton(
                    height: MediaQuery.of(context).size.width * 0.13,
                    minWidth: MediaQuery.of(context).size.width * 0.3,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      setState(() {
                        currentPage == 2.0
                            ? Get.offAll(() => const Home())
                            : _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                      });
                    },
                    child: currentPage != 3
                        ? Text(Loc.get['o_next'],
                            style: TextStyle(color: Colors.white))
                        : Image.asset("assets/images/location.png",
                            height: MediaQuery.of(context).size.width * 0.06)),
                //SizedBox(height: 24)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
