import 'package:flutter/material.dart';
import 'package:vegas_rocket/utilits/CreateUserData.dart';
import 'package:vegas_rocket/variables/my_colors.dart';

bool isDebug = true;

var w = 300.0;
var h = 600.0;

bool canDoAction0 = true;

List<Color> allColors = [
  MyColors.mainGreen,
  MyColors.mainOrange,
  MyColors.mainPurple,
  MyColors.mainRed,
];

List<String> allColorNamess = [
  'Green',
  'Orange',
  'Purple',
  'Red',
];

List<String> allShipsNames = ['Battlecruiser', 'Battleship', 'Cargo ship', 'Imperial Spaceship'];


int counter = 1;
  // Timer? timer;
  List<double> allVariants = [0,1.2,2.7,3,4.8,5,6.5,8,7,8];

  bool isPlaying = false;

    double currentMultiplicator = 0.0;
  int earnedMoney = 0;
  int expertBonus = 0;


  //data to save
  int myAccount = 1000;
  int betAmmount = 500;
  int hardLevel = 0;
  
  int currentColorIndex = 0;
  int currentShipIndex = 0;
  int currentPathIndex = 0;

  List<int> allAvaluableColorsIndexes = [0];
  List<int> allAvaluableShipsIndexes = [0];
  List<int> allAvaluablePathsIndexes = [0];



  List <int> allColorsPrices = [0,5000, 7000, 10000];
  List <int> allShipPrices = [0, 3000, 6000, 10000];
  List <int> allPathsPrices = [0,4000, 8000, 10000];


  List<PurchaseInfo> allPurchaseInfo = [];

 

int guitarType = 0;
int currentTune = 0;
int currentString = 1;


void stopCanDo0({milliseconds: int}) {
  print("false now");
  canDoAction0 = false;
  Future.delayed(Duration(milliseconds: milliseconds), () {
    print("true now");
    canDoAction0 = true;
  });
}
