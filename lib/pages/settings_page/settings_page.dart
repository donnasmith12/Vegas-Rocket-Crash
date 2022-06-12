





import 'package:app_review/app_review.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegas_rocket/main.dart';
import 'package:vegas_rocket/pages/purchase_page/purchase_page.dart';
import 'package:vegas_rocket/pages/shop_page/shop_page.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

privacyPolicyPressed(){
openPrivacyPolicy();
}

termsOfUsePressed(){
  openTermsOfUse();
}

rateAppPressed(){
  AppReview.requestReview;
}

supportPressed(){
  openSupport();
}


  @override
  Widget build(BuildContext context) {


premiumPressed(){

  Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => const PurchasePage(),
            ),
          );

}

    return Expanded(child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            const SizedBox(height: 4),
            titleSettings(),
            _MainMenu(premiumPressed),
          ],
        ),);
  }

Column _MainMenu(Function premiumPressed) {
    return Column(
      children: [
        _MenuBuyPremium(premiumPressed),
        _MenuPrivacyPolicy(),
        _MenuTermsOfUse(),
        _MenuRateApp(),
        _MenuSupport(),
        const SizedBox(
          height: 8,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget _MenuSupport() {
    return GestureDetector(
      onTap: () {
      supportPressed();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 0, 18),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFF1F1F1F),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('assets/images/support.png',
                fit: BoxFit.contain, height: 24, width: 24),
            const SizedBox(
              width: 27,
            ),
            AutoSizeText(
              'Support',
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
              maxLines: 1,
            ),
            const Spacer(),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _MenuRateApp() {
    return GestureDetector(
      onTap: () {
      rateAppPressed();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 0, 18),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFF1F1F1F),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('assets/images/rate_app.png',
                fit: BoxFit.contain, height: 24, width: 24),
            const SizedBox(
              width: 27,
            ),
            AutoSizeText(
              'Rate app',
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
              maxLines: 1,
            ),
            const Spacer(),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _MenuTermsOfUse() {
    return GestureDetector(
      onTap: () {
      termsOfUsePressed();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 0, 18),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFF1F1F1F),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('assets/images/terms_of_use.png',
                fit: BoxFit.contain, height: 24, width: 24),
            const SizedBox(
              width: 27,
            ),
            AutoSizeText(
              'Terms of use',
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
              maxLines: 1,
            ),
            const Spacer(),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _MenuPrivacyPolicy() {
    return GestureDetector(
      onTap: () {
      privacyPolicyPressed();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 0, 18),
        margin: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFF1F1F1F),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('assets/images/privacy_policy.png',
                fit: BoxFit.contain, height: 24, width: 24),
            const SizedBox(
              width: 27,
            ),
            AutoSizeText(
              'Privacy policy',
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
              maxLines: 1,
            ),
            const Spacer(),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _MenuBuyPremium(Function premiumPressed) {
    return GestureDetector(
      onTap: () {
      premiumPressed();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 17, 16, 17),
        margin:  EdgeInsets.fromLTRB(24, h/w >2 ? 0: 16, 24, 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFF1F1F1F),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset('assets/images/king.png',
                fit: BoxFit.contain, height: 24, width: 24),
            const SizedBox(
              width: 27,
            ),
            AutoSizeText(
              'Buy premium',
              textAlign: TextAlign.start,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1CC500),
              ),
              maxLines: 1,
            ),
            const Spacer(),
            const SizedBox(
              width: 8,
            ),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }

  SafeArea titleSettings() {
    return SafeArea(
      child: Container(
        height: 22,
        margin: const EdgeInsets.fromLTRB(0, 13, 0, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            
            AutoSizeText(
              'Settings',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFFFFFFF),
              ),
              maxLines: 1,
            ),
            const Spacer(),
            
          ],
        ),
      ),
    );
  }




}