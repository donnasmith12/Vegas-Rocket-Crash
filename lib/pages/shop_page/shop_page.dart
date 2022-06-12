import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegas_rocket/pages/chart_skins_page/chart_skins_page.dart';
import 'package:vegas_rocket/pages/color_page/color_page.dart';
import 'package:vegas_rocket/pages/rocket_skins_page/rocket_skins_page.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:vegas_rocket/variables/my_colors.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  openRocketSkinsPage() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => const RocketSkinsPage(),
      ),
    );
  }

  openChartSkinsPage() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => const ChartSkinsPage(),
      ),
    );
  }

  openColorPage() {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => const ColorPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/back.png',
                    height: 48,
                    width: 48,
                    fit: BoxFit.contain,
                  ),
                ),
                const Spacer(flex: 1),
                AutoSizeText(
                  'Shop',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: MyColors.lightText,
                  ),
                  maxLines: 1,
                ),
                const Spacer(flex: 1),
                const SizedBox(
                  width: 60,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        openRocketSkinsPage();
                      },
                      child: Container(
                        height: 152,
                        margin: const EdgeInsets.fromLTRB(24, 24, 24, 10),
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Color(0xff1F1F1F),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Spacer(flex: 1),
                                Image.asset(
                                  'assets/images/roket0.png',
                                  height: 56,
                                  width: 56,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                            const Spacer(flex: 1),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Rocket skins',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.lightText,
                                  ),
                                  maxLines: 1,
                                ),
                                const Spacer(flex: 1),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        openChartSkinsPage();
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        child: Container(
                          width: w - 48,
                          height: 152,
                          margin: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Color(0xff1F1F1F),
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  'assets/images/line0.png',
                                  fit: BoxFit.cover,
                                  height: 109,
                                  width: w - 48,
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  AutoSizeText(
                                    'Chart skins',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700,
                                      color: MyColors.lightText,
                                    ),
                                    maxLines: 1,
                                  ),
                                  const Spacer(flex: 1),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        openColorPage();
                      },
                      child: Container(
                        height: 152,
                        margin: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                        padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Color(0xff1F1F1F),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Spacer(flex: 1),
                                Container(
                                  height: 56,
                                  width: 56,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: MyColors.mainGreen,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(flex: 1),
                            Row(
                              children: [
                                AutoSizeText(
                                  'Color',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                    color: MyColors.lightText,
                                  ),
                                  maxLines: 1,
                                ),
                                const Spacer(flex: 1),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
