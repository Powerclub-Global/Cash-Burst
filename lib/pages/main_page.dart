import 'dart:convert';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fineartsociety/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/footer_widget.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  Future<List<dynamic>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/artists_data.json');
    var data = await json.decode(response);
    List<dynamic> artists = data['artists'];

    List<dynamic> featuredArtists = artists.where((item) {
      return item['featured'] == true;
    }).toList();
    print(featuredArtists);
    return featuredArtists;
  }

  List<String> steps = [
    "Insert your Bank Card",
    "Select Cash or Bitcoin",
    "Input your Desired Amount",
    "Enter your KYC Verification ( Bitcoin Only )",
    "Receive your Cash or Bitcoin!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: HangerDrawer(),
      backgroundColor: const Color(0xffB00B29),
      appBar: const CustomAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double firstFoldHeight =
              MediaQuery.of(context).size.height * 0.9325153374;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Hero Image
                Container(
                  height: firstFoldHeight,
                  color: const Color(0xffB00B29),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.01 * MediaQuery.sizeOf(context).height,
                      ),
                      Container(
                        height: 0.38 * MediaQuery.sizeOf(context).height,
                        width: 0.87 * MediaQuery.sizeOf(context).width,
                        child: Image.asset(
                          'assets/atm.png',
                          fit: BoxFit.contain,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      SizedBox(
                        height:
                            0.01388888889 * MediaQuery.sizeOf(context).height,
                      ),
                      AutoSizeText(
                        maxLines: 1,
                        "BITCOIN ATMs",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                        softWrap: true,
                      ),
                      SizedBox(
                        height:
                            0.01736111111 * MediaQuery.sizeOf(context).height,
                      ),
                      SizedBox(
                        height:
                            0.1480686695 * MediaQuery.sizeOf(context).height,
                        width: 0.7 * MediaQuery.sizeOf(context).width,
                        child: AutoSizeText(
                          "Redeem your Bank Card for Instant Cash or Bitcoin! Hanger DNS provides Fast, Reliable, and Convenient access to Cash and Bitcoin at any of our ATM Locations!",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height:
                            0.03680981595 * MediaQuery.sizeOf(context).height,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/findAtm');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: const Size(150, 55)),
                        child: const Text(
                          'Find ATM',
                          style:
                              TextStyle(color: Color(0xffB00B29), fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height:
                            0.04166666667 * MediaQuery.sizeOf(context).height,
                      ),
                      const Center(
                        child: Text(
                          'WE ACCEPT',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height:
                            0.01736111111 * MediaQuery.sizeOf(context).height,
                      ),
                      CarouselSlider(
                        items: [
                          'assets/press1.png',
                          'assets/press2.png',
                          'assets/press3.png',
                          'assets/press1.png',
                          'assets/press2.png',
                          'assets/press3.png',
                        ].map((pressImagePath) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              pressImagePath,
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: constraints.maxWidth <= 600
                              ? firstFoldHeight * 0.1
                              : firstFoldHeight * 0.19,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.2,
                          viewportFraction:
                              constraints.maxWidth <= 600 ? 0.4 : 0.2,
                          enableInfiniteScroll: false,
                        ),
                      ),
                    ],
                  ),
                ),

                // 2. Press Carousel

                const SizedBox(height: 20),
                Container(
                    height: firstFoldHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/money.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Positioned(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: SizedBox(
                                      width: 0.4861111111 *
                                          MediaQuery.sizeOf(context).width,
                                      child: const Text(
                                        "Your Trusted Partner for cash and Bitcoin Solutions",
                                        softWrap: true,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                // 3. Featured Artists
                SingleChildScrollView(
                  child: Container(
                    height: firstFoldHeight,
                    color: const Color(0xffB00B29),
                    child: Column(
                      children: [
                        SizedBox(
                          height:
                              0.0490797546 * MediaQuery.sizeOf(context).height,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 0.1041666667 *
                                  MediaQuery.sizeOf(context).width),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "How Does Bitcoin ATM’s Work?",
                                style: TextStyle(
                                    fontSize: 40, color: Colors.white),
                                softWrap: true,
                              ),
                              const SizedBox(
                                height: 70,
                              ),
                              SizedBox(
                                height: 500,
                                child: ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              FittedBox(
                                                fit: BoxFit.cover,
                                                child: CircleAvatar(
                                                  child: Center(
                                                      child:
                                                          Text('${index + 1}')),
                                                  radius: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width -
                                                        150,
                                                child: Text(
                                                  '${steps[index]}',
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 19),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 55,
                                          ),
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // 4, Use the FooterWidget here
                FooterWidget(),
              ],
            ),
          );
        },
      ),
    );
  }
}
