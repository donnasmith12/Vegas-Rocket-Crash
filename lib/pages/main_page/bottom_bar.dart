

import 'package:flutter/material.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:vegas_rocket/variables/my_colors.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.firstButtonPressed,
    required this.secondButtonPressed,
    required this.thirdButtonPressed,
  }) : super(key: key);

  final int selectedIndex;

  final Function firstButtonPressed;
  final Function secondButtonPressed;
  final Function thirdButtonPressed;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type : BottomNavigationBarType.fixed,
      backgroundColor: MyColors.bottomBarColor,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 50,
            child: ImageIcon(
              AssetImage("assets/images/icon0.png"),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/icon1.png"),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/icon2.png"),
          ),
          label: '',
        ),
        
      ],
      currentIndex: selectedIndex,
      selectedItemColor: allColors[currentColorIndex],
      unselectedItemColor: MyColors.unselectedItemColor,
      onTap: (int index) {
        if (index == 0)
        firstButtonPressed();
        else if (index == 1)
        secondButtonPressed();
        else
        thirdButtonPressed();
        
      },
    );
  }
}
