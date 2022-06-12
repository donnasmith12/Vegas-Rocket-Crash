import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegas_rocket/utilits/change_var.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:vegas_rocket/variables/my_colors.dart';

class ChartSkinsPage extends StatefulWidget {
  const ChartSkinsPage({Key? key}) : super(key: key);

  @override
  _ChartSkinsPageState createState() => _ChartSkinsPageState();
}

class _ChartSkinsPageState extends State<ChartSkinsPage> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    chooseSkin(int i) {
      if (allAvaluablePathsIndexes.contains(i)) {
        choosePathIndex(i);
        setState(() {});
      } else if (myAccount >= allPathsPrices[i]) {
        showDialog(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Buy chart skin'),
            content: Text(
                'Would you like to buy this chart skin for ${allPathsPrices[i]}?'),
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
                  addPath(i);
                  spendMoney(allPathsPrices[i]);
                  choosePathIndex(i);
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

    List<String> allChartNames = [
      'Gradient',
      'Line',
      'Double line',
      'Miter',
    ];
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
                        'Chart skins',
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
                                chooseSkin(i);
                              },
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                child: Container(
                                  width: w - 48,
                                  height: 180,
                                  margin:
                                      const EdgeInsets.fromLTRB(24, 24, 24, 24),
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 12),
                                  decoration:  BoxDecoration(
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(16)),
                                    color: const Color(0xff1F1F1F),
                                    border: currentPathIndex == i ? Border.all(color: MyColors.mainGreen) : null,
                                  ),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(16),
                                        ),
                                        child: Image.asset(
                                          'assets/images/line$i.png',
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
                                            allChartNames[i],
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
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(
                                            width: 24,
                                          ),

                                          currentPathIndex == i
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
                                                  allAvaluablePathsIndexes
                                                          .contains(i)
                                                      ? ''
                                                      : allPathsPrices[i]
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
