import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegas_rocket/main.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:vegas_rocket/variables/my_colors.dart';

class PurchasePage extends StatefulWidget {
  const PurchasePage({Key? key}) : super(key: key);

  @override
  _PurchasePageState createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {

  openPolicy(){
    openPrivacyPolicy();

  }
  openRestore(){
    restore();
  }
  openTermsOfUsePressed(){
    openTermsOfUse();
  }
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    var scaleFactor = 1.0;
    if (h/w < 2){
      scaleFactor = 0.8;
    }
    if(w < 330){
      scaleFactor = 0.7;
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              children: [
                const Spacer(flex: 1),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/images/close.png',
                    height: 24,
                    width: 24,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
              ],
            ),
            const Spacer(flex: 1),
            Container(
              margin:  EdgeInsets.fromLTRB(24, 24 * scaleFactor, 24, 0),
              child: Image.asset(
                'assets/images/purchase_back.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Buy premium to unlock all the features ',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 30 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 2,
                  ),
                   SizedBox(
                    height: 16 * scaleFactor,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '   \u2022  ',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Detailed ',
                          style: GoogleFonts.inter(
                            color: MyColors.mainGreen,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' statistics',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 4,
                  ),
                   SizedBox(
                    height: 16 * scaleFactor,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '   \u2022  ',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'All  ',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'unlockable content',
                          style: GoogleFonts.inter(
                            color: MyColors.mainGreen,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 4,
                  ),
                   SizedBox(
                    height: 16 * scaleFactor,
                  ),
                  AutoSizeText.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '   \u2022  ',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'AD ',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'removing',
                          style: GoogleFonts.inter(
                            color: MyColors.mainGreen,
                            fontSize: 22 * scaleFactor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    maxLines: 4,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1),
            Container(
              margin: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: InkWell(
                borderRadius:const BorderRadius.all(Radius.circular(16)),
                onTap: () async {
                  bool sub = await purchase();
                if (sub){
                  Navigator.pop(context);
                }
                },
                child: Container(
                  height: 56 * scaleFactor,
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: MyColors.mainGreen,
                  ),
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    'Buy for 0.99\$',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 18 * scaleFactor,
                      fontWeight: FontWeight.w500,
                      color: MyColors.lightText,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                  openPolicy();
                  },
                  child: AutoSizeText(
                    'Privacy Policy',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MyColors.lightText,
                    ),
                    maxLines: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    bool sub = await restore();
                if (sub){
                  Navigator.pop(context);
                }
                  },
                  child: 
                   AutoSizeText(
                    'Restore',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MyColors.lightText,
                    ),
                    maxLines: 1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  openTermsOfUsePressed();
                  },
                  child: 
                  AutoSizeText(
                    'Terms of Use',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MyColors.lightText,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
