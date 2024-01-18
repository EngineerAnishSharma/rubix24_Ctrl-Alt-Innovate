import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tsec_hack/consts/consts.dart';
import 'package:tsec_hack/utils/text_to_speech.dart';
import 'package:tsec_hack/views/Sarathi%20Support/know_your_rights.dart';
import 'package:url_launcher/url_launcher.dart';

class SarathiSupport extends StatefulWidget {
  const SarathiSupport({super.key});

  final String imgSlider1 = "assets/images/slider_1.jpeg";
  final String imgSlider2 = "assets/images/slider_2.jpeg";
  final String imgSlider3 = "assets/images/slider_3.jpeg";
  final String imgSlider4 = "assets/images/slider_4.jpeg";
  final String imgSlider5 = "assets/images/slider_5.jpeg";
  final String imgSlider6 = "assets/images/slider_6.jpeg";
  final String imgSlider7 = "assets/images/slider_7.jpeg";

  @override
  State<SarathiSupport> createState() => _SarathiSupportState();
}

class _SarathiSupportState extends State<SarathiSupport> {
  late final List<String> sliderList;

  @override
  void initState() {
    super.initState();
    sliderList = [
      widget.imgSlider1,
      widget.imgSlider2,
      widget.imgSlider3,
      widget.imgSlider4,
      widget.imgSlider5,
      widget.imgSlider6,
      widget.imgSlider7,
    ];
  }

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void _makePhoneCall(String _num) async {
    Uri url = Uri.parse("tel:+" + _num);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 110, 182, 254),
        title: const Text(
          "Sarathi Support",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyCard(color: Colors.teal, content: "Know Your Rights")
                  .onTap(() async {
                HapticFeedback.heavyImpact();
                await TextToSpeech.speakText("Know Your Rights");
                Get.to(() => const KnowYourRights());
              }),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Government Schemes",
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ).text.black.make(),
                    ),
                    VxSwiper.builder(
                        height: 200,
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: sliderList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              switch (index) {
                                case 0:
                                  HapticFeedback.heavyImpact();
                                  await TextToSpeech.speakText(
                                      "DISHA (Early Intervention and School Readiness Scheme)");
                                  _launchUrl(Uri.parse(
                                      'https://thenationaltrust.gov.in/content/scheme/disha.php'));

                                case 1:
                                  HapticFeedback.heavyImpact();
                                  await TextToSpeech.speakText(
                                      "VIKAAS (Day Care)");
                                  _launchUrl(Uri.parse(
                                      'https://thenationaltrust.gov.in/content/scheme/vikaas.php'));
                                case 2:
                                  HapticFeedback.heavyImpact();
                                  await TextToSpeech.speakText(
                                      "SAMARTH (Respite Care)");
                                  _launchUrl(Uri.parse(
                                      'https://thenationaltrust.gov.in/content/scheme/samarth.php'));
                                case 3:
                                  HapticFeedback.heavyImpact();
                                  await TextToSpeech.speakText(
                                      "GHARAUNDA (Group Home for Adults)");
                                  _launchUrl(Uri.parse(
                                      'https://thenationaltrust.gov.in/content/scheme/gharaunda.php'));
                                case 4:
                                  HapticFeedback.heavyImpact();
                                  await TextToSpeech.speakText(
                                      "NIRAMAYA (Health Insurance Scheme)");
                                  _launchUrl(Uri.parse(
                                      'https://thenationaltrust.gov.in/content/scheme/niramaya.php'));
                                case 5:
                                  HapticFeedback.heavyImpact();
                                  await TextToSpeech.speakText(
                                      "SAHYOGI (Caregiver training scheme)");
                                  _launchUrl(Uri.parse(
                                      'https://thenationaltrust.gov.in/content/scheme/sahyogi.php'));
                                case 6:
                                  HapticFeedback.heavyImpact();
                                  await TextToSpeech.speakText(
                                      "GYAN PRABHA (Educational support)");
                                  _launchUrl(Uri.parse(
                                      'https://thenationaltrust.gov.in/content/scheme/gyan-prabha.php'));
                              }
                            },
                            child: Image.asset(
                              sliderList[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .shadowSm
                                .margin(const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2.0))
                                .make(),
                          );
                        }),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                      child: Text(
                        "HelpLine Numbers",
                        style: GoogleFonts.aBeeZee(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ).text.black.make(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const myCard2(
                          name: "National Disability Helpline",
                          number: 18001814192,
                          colore: Colors.yellow,
                        ).onTap(() async {
                          HapticFeedback.heavyImpact();
                          await TextToSpeech.speakText(
                              "National Disability Helpline");
                          _makePhoneCall(18001814192.toString());
                        }),
                        const myCard2(
                          name: "Social Justice & Empowerment Helpline",
                          number: 01124365019,
                          colore: Colors.pink,
                        ).onTap(() async {
                          HapticFeedback.heavyImpact();
                          await TextToSpeech.speakText(
                              "Social Justice & Empowerment Helpline");
                          _makePhoneCall(01124365019.toString());
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const myCard2(
                          name:
                              "National Institute for Mentally Handicapped (NIMH)",
                          number: 01126517151,
                          colore: Colors.green,
                        ).onTap(() async {
                          HapticFeedback.heavyImpact();
                          await TextToSpeech.speakText(
                              "National Institute for Mentally Handicapped (NIMH)");
                          _makePhoneCall(01126517151.toString());
                        }),
                        const myCard2(
                          name:
                              "National Institute for the Visually Handicapped (NIVH)",
                          number: 01126514606,
                          colore: Color.fromARGB(255, 188, 80, 231),
                        ).onTap(() async {
                          HapticFeedback.heavyImpact();
                          await TextToSpeech.speakText(
                              "National Institute for the Visually Handicapped (NIVH)");
                          _makePhoneCall(01126514606.toString());
                        })
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// ignore: camel_case_types
class myCard2 extends StatelessWidget {
  final String name;
  final int number;
  final Color colore;
  const myCard2({
    required this.name,
    required this.number,
    required this.colore,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        width: 155,
        height: 155,
        decoration: BoxDecoration(
          color: colore,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            number.toString(),
            style: GoogleFonts.aBeeZee(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ]));
  }
}

class MyCard extends StatelessWidget {
  final Color color;
  final String content;
  const MyCard({
    super.key,
    required this.color,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              content,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ));
  }
}
