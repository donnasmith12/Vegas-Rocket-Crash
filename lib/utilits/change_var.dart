



import 'package:vegas_rocket/utilits/CreateUserData.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';

betPlus() async {
  betAmmount = betAmmount + 50;
 Settings settings = await getSettings();
 settings.betAmmount = betAmmount;
 saveSettings(settings:settings);
}

betMinus() async {
  if (betAmmount > 50) {
    betAmmount = betAmmount - 50;
    Settings settings = await getSettings();
 settings.betAmmount = betAmmount;
 saveSettings(settings:settings);
  }
}


changeHardLevel() async {
  hardLevel = (hardLevel + 1) % 2;
  Settings settings = await getSettings();
 settings.hardLevel = hardLevel;
 saveSettings(settings:settings);
}


chooseShipIndex(int i) async {
  currentShipIndex = i;
  Settings settings = await getSettings();
 settings.currentShipIndex = currentShipIndex;
 saveSettings(settings:settings);
}


addShip(int i) async {
  if (!allAvaluableShipsIndexes.contains(i)) {
    allAvaluableShipsIndexes.add(i);
      Settings settings = await getSettings();
 settings.allAvaluableShipsIndexes = allAvaluableShipsIndexes;
 saveSettings(settings:settings);
  }
}

spendMoney(int i) async {
  if (myAccount > i) {
    myAccount = myAccount - i;
    Settings settings = await getSettings();
 settings.myAccount = myAccount;
 saveSettings(settings:settings);
  }
}

earnMoney(int i) async {
  
    myAccount = myAccount + i;

    Settings settings = await getSettings();
 settings.myAccount = myAccount;
 saveSettings(settings:settings);
  
}

fenixMoney() async {
  if(myAccount < 1000){
    myAccount = 1000;
    Settings settings = await getSettings();
 settings.myAccount = myAccount;
 saveSettings(settings:settings);

  }
}


choosePathIndex(int i) async {
  currentPathIndex = i;
  Settings settings = await getSettings();
 settings.currentPathIndex = currentPathIndex;
 saveSettings(settings:settings);
}

addPath(int i) async {
  if (!allAvaluablePathsIndexes.contains(i)) {
    allAvaluablePathsIndexes.add(i);
    Settings settings = await getSettings();
 settings.allAvaluablePathsIndexes = allAvaluablePathsIndexes;
 saveSettings(settings:settings);
  }
}


chooseColorIndex(int i) async {
  currentColorIndex = i;
  Settings settings = await getSettings();
 settings.currentColorIndex = currentColorIndex;
 saveSettings(settings:settings);
}

addColor(int i) async {
  if (!allAvaluableColorsIndexes.contains(i)) {
    allAvaluableColorsIndexes.add(i);
    Settings settings = await getSettings();
 settings.allAvaluableColorsIndexes = allAvaluableColorsIndexes;
 saveSettings(settings:settings);
  }
}
