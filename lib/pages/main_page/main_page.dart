



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vegas_rocket/pages/game_page/game_page.dart';
import 'package:vegas_rocket/pages/main_page/bottom_bar.dart';
import 'package:vegas_rocket/pages/purchase_page/purchase_page.dart';
import 'package:vegas_rocket/pages/settings_page/settings_page.dart';
import 'package:vegas_rocket/pages/stat_page/stat_page.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';





class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

  openGame() {
    setState(() {
      pageIndex = 0;
    });
  }

  openStat() {
    setState(() {
      pageIndex = 1;
    });
  }

  openSettings() {
    setState(() {
      pageIndex = 2;
    });
  }

openPurchasePage(){
  Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => const PurchasePage(),
            ),
          );
}


refresh() {
  setState(() {});
}


  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          if (pageIndex == 0)

        GamePage(refresh: refresh,),

          if (pageIndex == 1)

         const StatPage(),

          if (pageIndex == 2)

          const SettingsPage(),
          
          MainBottomNavigationBar(
      selectedIndex: pageIndex,
      firstButtonPressed: () {
        openGame();
      },
      secondButtonPressed: () {
        openStat();
        
      },
      thirdButtonPressed: () {
        openSettings();
      },
      
    ),
        ],
      ),
    );
  }

  // StreamBuilder bottomBar() {
  //   return StreamBuilder<bool>(
  //               stream: SubscriptionContainer.instance.isSubscribed,
  //               builder: (context, snapshot) {
  //                 final subscribed = (snapshot.data ?? false);
  //                 return MainBottomNavigationBar(
  //     selectedIndex: pageIndex,
  //     firstButtonPressed: () {
  //       openGame();
  //     },
  //     secondButtonPressed: () {
  //       openStat();
        
  //     },
  //     thirdButtonPressed: () {
  //       openSettings();
  //     },
      
  //   );
  //               });
  
  // }
}






