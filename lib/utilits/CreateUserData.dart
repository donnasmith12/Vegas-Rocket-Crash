import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vegas_rocket/utilits/change_var.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:intl/intl.dart';

part 'CreateUserData.g.dart';

Future<void> createUserData() async {
await Hive.initFlutter();
  Hive.registerAdapter(SettingsAdapter());
  Hive.registerAdapter(PurchaseInfoAdapter());
  

  var box = await Hive.openBox<PurchaseInfo>('PurchaseInfo');

  if (box.length > 0) {
    allPurchaseInfo = box.values.toList();
  }

  var boxSettings = await Hive.openBox<Settings>('Settings');

  if (boxSettings.length < 1) {
   Settings settings = Settings(
      myAccount: myAccount,
      betAmmount: betAmmount,
      hardLevel: hardLevel,
      currentColorIndex: currentColorIndex,
      currentShipIndex: currentShipIndex,
      currentPathIndex: currentPathIndex,
      allAvaluableColorsIndexes: allAvaluableColorsIndexes,
      allAvaluableShipsIndexes: allAvaluableShipsIndexes,
      allAvaluablePathsIndexes: allAvaluablePathsIndexes,
    );
    boxSettings.add(settings);
  }
  else{
    myAccount = boxSettings.values.toList()[0].myAccount;
    betAmmount = boxSettings.values.toList()[0].betAmmount;
    hardLevel = boxSettings.values.toList()[0].hardLevel;
    currentColorIndex = boxSettings.values.toList()[0].currentColorIndex;
    currentShipIndex = boxSettings.values.toList()[0].currentShipIndex;
    currentPathIndex = boxSettings.values.toList()[0].currentPathIndex;
    allAvaluableColorsIndexes = boxSettings.values.toList()[0].allAvaluableColorsIndexes;
    allAvaluableShipsIndexes = boxSettings.values.toList()[0].allAvaluableShipsIndexes;
    allAvaluablePathsIndexes = boxSettings.values.toList()[0].allAvaluablePathsIndexes;
  }

  fenixMoney();

}


Future<Settings> getSettings() async {
  var box = await Hive.openBox<Settings>('Settings');
  Settings settings = box.values.toList()[0];
  return settings;
}

saveSettings({settings = Settings}) async {
  var box = await Hive.openBox<Settings>('Settings');
  box.putAt(0, settings);
}

Future<void> addNewInfo({
  type = String,
  bet = String,
  earned = String,
  bonus = String,
  multyplicator = String,
  win = String,
  currentDay = String,
}) async {

   final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String currentDay = formatter.format(now);

  var box = await Hive.openBox<PurchaseInfo>('PurchaseInfo');

  PurchaseInfo purchaseInfo = PurchaseInfo(
    type: type,
    bet: bet,
    earned: earned,
    bonus: bonus,
    multyplicator: multyplicator,
    win: win,
    currentDay: currentDay,
  );
  box.add(purchaseInfo);
  // print(box.length);
  allPurchaseInfo = box.values.toList();
}


@HiveType(typeId: 12)
class PurchaseInfo {
  PurchaseInfo({
    required this.type,
    required this.bet,
    required this.earned,
    required this.bonus,
    required this.multyplicator,
    required this.win,
    required this.currentDay,


  });

  @HiveField(0)
  String type;
  @HiveField(1)
  String bet;
  @HiveField(2)
  String earned;
  @HiveField(3)
  String bonus;
  @HiveField(4)
  String multyplicator;
  @HiveField(5)
  String win;
  @HiveField(6)
  String currentDay;
  

}

@HiveType(typeId: 13)
class Settings {
  Settings({
    required this.myAccount,
    required this.betAmmount,
    required this.hardLevel,
    required this.currentColorIndex,
    required this.currentShipIndex,
    required this.currentPathIndex,
    required this.allAvaluableColorsIndexes,
    required this.allAvaluableShipsIndexes,
    required this.allAvaluablePathsIndexes,
  });

  @HiveField(0)
  int myAccount;
  @HiveField(1)
  int betAmmount;
  @HiveField(2)
  int hardLevel;
  @HiveField(3)
  int currentColorIndex;
  @HiveField(4)
  int currentShipIndex;
  @HiveField(5)
  int currentPathIndex;
  @HiveField(6)
  List<int> allAvaluableColorsIndexes;
  @HiveField(7)
  List<int> allAvaluableShipsIndexes;
  @HiveField(8)
  List<int> allAvaluablePathsIndexes;
}

