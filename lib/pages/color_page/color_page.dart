import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegas_rocket/utilits/change_var.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:vegas_rocket/variables/my_colors.dart';

class ColorPage extends StatefulWidget {
  const ColorPage({Key? key}) : super(key: key);

  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    changeColor(int i) {
      if (allAvaluableColorsIndexes.contains(i)) {
        chooseColorIndex(i);
        setState(() {});
      } else if (myAccount >= allColorsPrices[i]) {
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Buy color'),
            content: Text(
                'Would you like to buy this color for ${allColorsPrices[i]}?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                isDefaultAction: true,
                child: const Text("Cancel"),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  addColor(i);
                  spendMoney(allPathsPrices[i]);
                  chooseColorIndex(i);
                  setState(() {});
                  Navigator.pop(context);
                },
                isDefaultAction: true,
                child: const Text("Buy"),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Can not buy'),
            content: const Text('Not enouth money'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                isDefaultAction: true,
                child: const Text("OK"),
              )
            ],
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
                        'Color',
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
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(24),
                            child: AutoSizeText.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Your account:',
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' $myAccount ',
                                    style: GoogleFonts.inter(
                                      color: MyColors.mainGreen,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          for (var i = 0; i < 4; i++)
                            GestureDetector(
                              onTap: () {
                                changeColor(i);
                              },
                              child: Container(
                                height: 178,
                                margin:
                                    const EdgeInsets.fromLTRB(24, 12, 24, 12),
                                padding:
                                    const EdgeInsets.fromLTRB(24, 16, 16, 16),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(16)),
                                  color: const Color(0xff1F1F1F),
                                  border: currentColorIndex == i ? Border.all(color: MyColors.mainGreen) : null,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Spacer(flex: 1),
                                        Container(
                                          height: 56,
                                          width: 56,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(12)),
                                            color: allColors[i],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(flex: 1),
                                    Row(
                                      children: [
                                        AutoSizeText(
                                          allColorNamess[i],
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
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        currentColorIndex == i
                                            ? AutoSizeText(
                                                'Chosen',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.inter(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: MyColors.lightText
                                                      .withOpacity(0.5),
                                                ),
                                                maxLines: 1,
                                              )
                                            : AutoSizeText(
                                                allAvaluableColorsIndexes
                                                        .contains(i)
                                                    ? ''
                                                    : allColorsPrices[i]
                                                        .toString(),
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.inter(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: MyColors.mainGreen,
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
          ],
        ),
      ),
    );
  }
}
