import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rubix_application/consts/consts.dart';
import 'package:rubix_application/views/home_screen/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
                  Text(
                    "Where talent takes center stage, not disability.",
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
                  Text(
                    "Disability is just one part of the story.",
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
                  Text("Let Sarathi write the rest.", style: GoogleFonts.lato())
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
                    "Sarath is your hero",
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
                    "Sarathi: Because everyone deserves a chance to soar.",
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
                        ? const Text('    Next',
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
