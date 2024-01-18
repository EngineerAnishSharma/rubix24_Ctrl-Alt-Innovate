import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/utils/text_to_speech.dart';
import 'package:tsec_hack/views/home_screen/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class KnowYourRights extends StatefulWidget {
  const KnowYourRights({super.key});

  @override
  State<KnowYourRights> createState() => _TestState();
}

class _TestState extends State<KnowYourRights> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: const [
                Slides(
                    image: "assets/images/Equal Job Opportunities.jpeg",
                    description:
                        "You have the right to get a job like everyone else. Employers should help you do your job comfortably"),
                Slides(
                    image: "assets/images/No Unfair Treatment.jpeg",
                    description:
                        "People cannot treat you badly because of your disability. This includes schools, hospitals, and other public places"),
                Slides(
                    image: "assets/images/Easy Access Everywhere.jpeg",
                    description:
                        "Buildings, transport, and information should be easy for you to use. People should make places and websites accessible for you"),
                Slides(
                    image: "assets/images/Education for Everyone.jpeg",
                    description:
                        "You have the right to go to school like any other person. Schools should help you learn, and teachers should understand your needs"),
                Slides(
                    image: "assets/images/Financial Help if Needed.jpeg",
                    description:
                        "If you need money or support, there are programs to help you. The government provides assistance for your well-being"),
                Slides(
                    image: "assets/images/Government Job Opportunities.jpeg",
                    description:
                        "You have the chance to work for the government. There are reserved positions to make sure you get a fair opportunity"),
                Slides(
                    image: "assets/images/Make Your Own Decisions.jpeg",
                    description:
                        "You have the right to decide things for yourself, like getting married or managing your money"),
                Slides(
                    image: "assets/images/Understandable Information.jpeg",
                    description:
                        "People should give you information in a way you can understand. This could be through Braille, sign language, or other helpful methods"),
                Slides(
                    image: "assets/images/Good Health Services.jpeg",
                    description:
                        "You should get good healthcare that meets your needs. Special hospitals and services are there for you"),
                Slides(
                    image: "assets/images/Protection from Harm.jpeg",
                    description:
                        "No one should hurt or exploit you. Laws are there to keep you safe from violence and abuse"),
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
                    count: 10,
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
                      child: currentPage != 10
                          ? const Text('    Next',
                              style: TextStyle(color: Colors.white))
                          : Image.asset("assets/images/location.png",
                              height:
                                  MediaQuery.of(context).size.width * 0.06)),
                  //SizedBox(height: 24)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Slides extends StatelessWidget {
  final String image;
  final String description;
  const Slides({
    super.key,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            HapticFeedback.mediumImpact();
            await TextToSpeech.speakText(description);
          },
          child: Image.asset(
            image,
            height: 350,
            width: 350,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 46.0, right: 20.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ).text.white.make(),
        ),
        const SizedBox(
          height: 20,
        ),
        Text("", style: GoogleFonts.lato()),
      ],
    );
  }
}
