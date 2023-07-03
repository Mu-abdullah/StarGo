import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:seller/core/utils/app_routs.dart';

import '../widgets/custom_alertwith_animation.dart';

class MyFirebaseMessaging {
  void setupFirebase(context) async {
    await FirebaseMessaging.instance.getToken();
    subscribeToTopic();
    notification(context);
    initialMessage(context);
  }

  subscribeToTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic("pizzaStarGo");
  }

  notification(context) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      customAlertWithAnimation(context);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      customAlertWithAnimation(context);
    });
  }

  initialMessage(context) async {
    var msg = await FirebaseMessaging.instance.getInitialMessage();
    if (msg != null) GoRouter.of(context).push(AppRouter.orderScreen);
  }
}
