import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:vegas_rocket/main.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:vegas_rocket/variables/my_colors.dart';

class StatPage extends StatelessWidget {
  const StatPage({
    Key? key,
  }) : super(key: key);

  
  String getMonth(){

final DateTime now = DateTime.now();
    int tempSum = 0;

    for (var i = 0; i < allPurchaseInfo.length; i++){

      var parsedDate = DateTime.parse(allPurchaseInfo[i].currentDay);
      if(parsedDate.month == now.month && parsedDate.year == now.year){
        if(allPurchaseInfo[i].win == "WIN"){
          tempSum += int.parse(allPurchaseInfo[i].earned);
        }
        if(allPurchaseInfo[i].win == "LOSE"){
          tempSum -= int.parse(allPurchaseInfo[i].earned);
        }
        
      }
      
    }
    return tempSum.toString();
  }

    String getWeek(){

final DateTime now = DateTime.now();
    int tempSum = 0;

    for (var i = 0; i < allPurchaseInfo.length; i++){

      var parsedDate = DateTime.parse(allPurchaseInfo[i].currentDay);
      if(weekNumber(parsedDate) == weekNumber(now) && parsedDate.year == now.year){
        if(allPurchaseInfo[i].win == "WIN"){
          tempSum += int.parse(allPurchaseInfo[i].earned);
        }
        if(allPurchaseInfo[i].win == "LOSE"){
          tempSum -= int.parse(allPurchaseInfo[i].earned);
        }
        
      }
      
    }
    return tempSum.toString();
  }

  int weekNumber(DateTime date) {
  int dayOfYear = int.parse(DateFormat("D").format(date));
  return ((dayOfYear - date.weekday + 10) / 7).floor();
}

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(h/w < 2) const SizedBox(height: 10,),
        SafeArea(
          child: Row(
            children: [
              const Spacer(flex: 1),
              AutoSizeText(
                'Statistics',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: MyColors.lightText,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
        StreamBuilder<bool>(
                    stream: subscribedController.stream,
                    builder: (context, snapshot) {
                      // final subcribed = snapshot.data?? false;
                      if (snapshot.data ?? subscribed){
                        return Column(children: [
                          Container(
          padding: EdgeInsets.fromLTRB(24, h/w > 2 ? 0: 12, 24, 10),
          child: AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Points earned per month: ',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: getMonth(),
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
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 10),
          child: AutoSizeText.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Points earned per week: ',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: getWeek(),
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
        
                        ],);
                      }
                      else{
                      return Container();
                      }
                      
  }),
        Expanded(
          child: ListView.builder(
            itemCount: allPurchaseInfo.length,
            //itemExtent: 152,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                height: 136,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.5), width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AutoSizeText(
                          allPurchaseInfo[index].win.toUpperCase(),
                          textAlign: TextAlign.start,
                          style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: allPurchaseInfo[index].win == "WIN"
                                ? MyColors.mainGreen
                                : MyColors.mainRedDark,
                          ),
                          maxLines: 1,
                        ),
                        const Spacer(),
                        AutoSizeText(
                          allPurchaseInfo[index].multyplicator,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFFFFFFFF),
                          ),
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          allPurchaseInfo[index].bonus != '0'
                              ? '+${allPurchaseInfo[index].bonus}'
                              : '',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFFFFFFF),
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Bet sum: ',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                          TextSpan(
                            text: ' ${allPurchaseInfo[index].bet}',
                            style: GoogleFonts.inter(
                              color: MyColors.mainRedDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Earned: ',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                          TextSpan(
                            text:
                                '${allPurchaseInfo[index].win == "WIN" ? '+' : '-'}${allPurchaseInfo[index].earned} ',
                            style: GoogleFonts.inter(
                              color: allPurchaseInfo[index].win == "WIN"
                                  ? MyColors.mainGreen
                                  : MyColors.mainRedDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    StreamBuilder<bool>(
                    stream: subscribedController.stream,
                    builder: (context, snapshot) {
                      // final subcribed = snapshot.data?? false;
                      if (snapshot.data ?? subscribed){
                        return 
                        AutoSizeText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Game type: ',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFFFFFFF),
                            ),
                          ),
                          TextSpan(
                            text: ' ${allPurchaseInfo[index].type} ',
                            style: GoogleFonts.inter(
                              color:allPurchaseInfo[index].type == "Normal" ? MyColors.mainGreen : MyColors.mainRedDark,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                      }
                      else{
                      return Container();
                      }
                      
  }),
                    
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
