import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vegas_rocket/custom_widgets/shadow_text.dart';
import 'package:vegas_rocket/pages/shop_page/shop_page.dart';
import 'package:vegas_rocket/painting/dlouble_line.dart';
import 'package:vegas_rocket/painting/one_line_plus_vertical.dart';
import 'package:vegas_rocket/painting/only_one_line_gradient.dart';
import 'package:vegas_rocket/painting/streight_line_gradient.dart';
import 'package:vegas_rocket/utilits/CreateUserData.dart';
import 'package:vegas_rocket/utilits/change_var.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:vegas_rocket/variables/my_colors.dart';

class GamePage extends StatefulWidget {
   const GamePage({
    Key? key, required this.refresh,
  }) : super(key: key);
  final Function refresh;
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isPlaying = false;


  bool checkFail(){
   int value = Random().nextInt(50);
   if (value % 5 == 0){
     return true;
   }
   else{
     return false;
   }
  }

  checkForNewValue() {
    if (counter < 10 && isPlaying) {
      counter++;
      if (allVariants[counter - 1] > 2.5 && hardLevel == 1){
        expertBonus = 1000;
      }
      if (allVariants[counter - 1] > 3.0 && hardLevel == 1){
        expertBonus = 1500;
      }
      if (allVariants[counter - 1] > 4.0 && hardLevel == 1){
        expertBonus = 3000;
      }
      setState(() {});
    }
    if(counter > 2 && checkFail() && isPlaying && !isWin){
      userLoose();
    }
    if (counter > 9 && !isWin && !isLoose){
      userWin();
    }
    
  }

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 1), (Timer t) => checkForNewValue());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  openShopPage() async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => const ShopPage(),
      ),
    );
    widget.refresh();
    // setState(() {});
  }

  startGame(){
    if (!isPlaying && !isWin && !isLoose){
      if (canDoAction0){
         generateAllVariants();
      counter = 1;
      expertBonus = 0;
      isWin = false;
      isLoose = false;
    isPlaying = true;
    setState(() {
        
      });
      }
     
    }
    else if (/*!isPlaying*/canDoAction0 && isWin){
      removeVariants();
      counter = 1;
      expertBonus = 0;
      isWin = false;
      isLoose = false;
      isPlaying = false;
      setState(() {
        
      });
    }
    else if (!isPlaying && isLoose && canDoAction0){
      removeVariants();
      counter = 1;
      expertBonus = 0;
      isWin = false;
      isLoose = false;
      setState(() {
        
      });
    }
    else if (isPlaying){
      userWin();
    }
    print(allVariants);
  }

  userWin() async {
    isPlaying = false;
      isWin = true;
      stopCanDo0(milliseconds:1000);

      earnedMoney = (betAmmount * allVariants[counter - 1]).toInt() + expertBonus;
      earnMoney(earnedMoney);
      await addNewInfo(
  win: "WIN",     
  type: hardLevel == 0 ? "Normal" : "Expert",
  bet: betAmmount.toString(),
  earned: earnedMoney.toString(),
  bonus:expertBonus.toString(),
  multyplicator: allVariants[counter - 1].toStringAsFixed(2),
);
      setState(() {
        
      });
  }
  userLoose() async {
isPlaying = false;
      isLoose = true;
      spendMoney(betAmmount);
      stopCanDo0(milliseconds:1000);

     await addNewInfo(
  win: "LOSE",     
  type: hardLevel == 0 ? "Normal" : "Expert",
  bet: betAmmount.toString(),
  earned: earnedMoney.toString(),
  bonus:expertBonus.toString(),
  multyplicator: allVariants[counter - 1].toStringAsFixed(2),
);
  }

  generateAllVariants(){
    allVariants = [0];
    currentMultiplicator = 0.0;
    if (hardLevel == 0){
      for (var i = 0; i< 9; i++){
int randomInt = Random().nextInt(100);
currentMultiplicator = (currentMultiplicator + randomInt / 100);
allVariants.add(currentMultiplicator);
    }
    }
    else{
      for (var i = 0; i< 9; i++){
int randomInt = Random().nextInt(150) - 50;
currentMultiplicator = (currentMultiplicator + randomInt / 100);
if (currentMultiplicator < 1){
  currentMultiplicator = 1;
}
allVariants.add(currentMultiplicator);
    }
    }
    
  }
  removeVariants(){
    allVariants = [0];
  }

bool isLoose = false;
bool isWin = false;

String buttonTitle(){
  if (isPlaying && !isWin) {
    return 'Stop';
  }
  else if (isWin){
    return "Hooray";
  }
  else if (isLoose){
    return "Try again";
  }
  else {
    return "Start";
  }
}

  @override
  Widget build(BuildContext context) {
// print(h);
    var canvasW = w;
    var scaleFactor = 1.0;
    if (w < 330){
      canvasW = w * 0.75;
     scaleFactor = 0.7;
    }
    else if (h/w < 2){
      canvasW = w * 0.9;
     scaleFactor = 0.75;
    }
    else if (w < 670){
    scaleFactor = 0.85;
    }
    return Expanded(
      child: Column(children: [
        SafeArea(
          child: Row(
            children: [
              const SizedBox(
                width: 60,
              ),
              const Spacer(flex: 1),
              AutoSizeText(
                'Vegas Rocket',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.lightText,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              GestureDetector(
                onTap: () {
                  openShopPage();
                },
                child: Image.asset(
                  'assets/images/shop_icon.png',
                  height: 48,
                  width: 48,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
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

        Container(
          width: canvasW,
          height: canvasW,
          child: Stack(
            children: [
              Image.asset(
                'assets/images/back_field.png',
                height: canvasW,
                width: canvasW,
                fit: BoxFit.contain,
              ),
              Positioned(
                left: canvasW * 0.1,
                top: canvasW * 0,
                right: canvasW * 0.05,
                bottom: canvasW * 0.05,
                child: Container(
                  height: canvasW * 0.95,
                  width: canvasW * 0.85,
                  // color: Colors.red,
                  child: Stack(clipBehavior: Clip.none, children: [

                    Container(
                      height: canvasW * 0.95,
                      width: canvasW * 0.85,
                      // color: Colors.white,
                      child: CustomPaint(
                        foregroundPainter:

                            // DoubleSmoothLinePainter(const Color.fromARGB(255, 97, 233, 23), [0,1,2,3,4,5,6.5,8,7]),
                            // OnlyOneSmoothLinePainter(Colors.green, [0,1,2,3,4,5,6.5,8,7]),
                            
                            [GradientSmoothLinePainter(allColors[currentColorIndex],
                                allVariants.take(counter).toList()),
                        OneLinePlusVerticalPainter(allColors[currentColorIndex],
                                allVariants.take(counter).toList()),
                                DoubleSmoothLinePainter(allColors[currentColorIndex],
                                allVariants.take(counter).toList()),
                                SteightGradientLinePainter(allColors[currentColorIndex],
                                allVariants.take(counter).toList()),][currentPathIndex],
                        // SteightGradientLinePainter(const Color.fromARGB(255, 97, 233, 23), allVariants.take(_counter).toList()),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      right: 0,
                      child: Column(
                        children: [

                          allVariants[counter - 1] > 0 ?
                          AutoSizeText(
                                    'x${allVariants[counter - 1].toStringAsFixed(2)}',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.lightText,
                                    ),
                                    maxLines: 1,
                                  ):
                                  Image.asset(
                                            'assets/images/vegas.png',
                                            fit: BoxFit.contain,
                                            width: w * 0.2,
                                          ),
                                  if (expertBonus > 0)
                                  AutoSizeText(
                                    '+$expertBonus',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                      color: MyColors.lightText,
                                    ),
                                    maxLines: 1,
                                  ),
                        ],
                      ),),

                    Positioned(
                      left: counter == 0 ? 0 : (counter - 1) * canvasW * 0.085,
                      bottom: counter == 0
                          ? 0
                          : allVariants.take(counter).toList().last * canvasW * 0.095,
                      child: Image.asset(
                        'assets/images/roket$currentShipIndex.png',
                        width: canvasW * 0.1,
                        height: canvasW * 0.1,
                        fit: BoxFit.contain,
                        color: allColors[currentColorIndex],
                      ),
                    ),

              if (isLoose)
              Stack(
                children: [
                  Positioned(
                      bottom: 0,
                            top: 0,
                            left: 0,
                            right: -canvasW * 0.1,
                    child: Container(color: Colors.black.withOpacity(0.5)),),

                    Positioned(
                        // bottom: 100,
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            
                            Image.asset(
                              'assets/images/lose.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
            

            Positioned(
                left: canvasW * 0.05,
                top: 0,
                child: Text('-$betAmmount', style: GoogleFonts.inter(
                          color: const Color(0xffED4985),
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                          shadows: [
                    const Shadow(
                      color: Color(0xffED4985),
                      offset: Offset(0, 0),
                      blurRadius: 40,
                    ),
                    const Shadow(
                      color: Color(0xffED4985),
                      offset: Offset(0, 0),
                      blurRadius: 40,
                    ),
                    
                  ],
                        ),),
              ),
                 
                ],
              ),

              if (isWin)
              Stack(
                children: [
                  Positioned(
                      bottom: 0,
                            top: 0,
                            left: 0,
                            right: -canvasW * 0.1,
                    child: Container(color: Colors.black.withOpacity(0.5)),),

                    Positioned(
                        // bottom: 100,
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            
                            Image.asset(
                              'assets/images/win.png',
                              fit: BoxFit.fitHeight,
                            ),
                          ],
                        ),
                      ),
            

            Positioned(
                left: canvasW * 0.05,
                top: 0,
                child: Text('$earnedMoney', style: GoogleFonts.inter(
                          color: const Color(0xffFEE800),
                          fontSize: 38,
                          fontWeight: FontWeight.w800,
                          shadows: [
                    const Shadow(
                      color: Color(0xffFEE800),
                      offset: Offset(0, 0),
                      blurRadius: 40,
                    ),
                    const Shadow(
                      color: Color(0xffFEE800),
                      offset: Offset(0, 0),
                      blurRadius: 40,
                    ),
                    
                  ],
                        ),),
              ),
                 
                ],
              ),

              
                  ]),
                ),
              ),

              // Positioned(
              //   left: w * 0.15,
              //   top: 0,
              //   child: Text('-$betAmmount', style: GoogleFonts.inter(
              //             color: const Color(0xffED4985),
              //             fontSize: 38,
              //             fontWeight: FontWeight.w800,
              //             shadows: [
              //       Shadow(
              //         color: const Color(0xffED4985),
              //         offset: const Offset(0, 0),
              //         blurRadius: 40,
              //       ),
              //       Shadow(
              //         color: const Color(0xffED4985),
              //         offset: const Offset(0, 0),
              //         blurRadius: 40,
              //       ),
                    
              //     ],
              //           ),),
              // ),
              
              
              // Image.asset(
              //           'assets/images/win.png',
              //           fit: BoxFit.contain,
              //         ),
                      
            ],
          ),
        ),
 
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                  height: 64 * scaleFactor,
                  margin: EdgeInsets.fromLTRB(24, 24 * scaleFactor, 8, 0),
                  padding: EdgeInsets.fromLTRB(24, 10 * scaleFactor, 24, 10 * scaleFactor),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Color(0xff1F1F1F),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (!isPlaying && !isWin && !isLoose) {
                            betMinus();
                            setState(() {});
                          }
                        },
                        child: Image.asset(
                          'assets/images/minus${isPlaying || isWin || isLoose ? 1 : 0}.png',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                      AutoSizeText(
                        '$betAmmount',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: MyColors.lightText,
                        ),
                        maxLines: 1,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!isPlaying && !isWin && !isLoose) {
                            betPlus();
                            setState(() {});
                          }
                        },
                        child: Image.asset(
                          'assets/images/plus${isPlaying || isWin || isLoose ? 1 : 0}.png',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  if(!isPlaying && !isLoose && !isWin){
                    changeHardLevel();
                  setState(() {});
                  }
                },
                child: Container(
                    height: 64 * scaleFactor,
                    margin: EdgeInsets.fromLTRB(8, 24 * scaleFactor, 24, 0),
                    padding: EdgeInsets.fromLTRB(16, 10 * scaleFactor, 16, 10 * scaleFactor),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Color(0xff1F1F1F),
                    ),
                    alignment: Alignment.center,
                    child: AutoSizeText(
                      hardLevel == 0 ? 'Normal' : 'Expert',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: isPlaying ? Colors.grey : hardLevel == 0
                            ? MyColors.mainGreen
                            : MyColors.mainRedDark,
                      ),
                      maxLines: 1,
                    )),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            startGame();
          },
          child: Container(
            height: 58 * scaleFactor,
            width: w - 48,
            margin:  EdgeInsets.fromLTRB(24, 24 * scaleFactor, 24, 8),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: allColors[currentColorIndex],
            ),
            alignment: Alignment.center,
            child: AutoSizeText(
              buttonTitle(),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: MyColors.lightText,
              ),
              maxLines: 1,
            ),
          ),
        ),
      ]),
    );
  }
}
