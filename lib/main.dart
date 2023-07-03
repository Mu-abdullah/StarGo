import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:seller/core/utils/assets.dart';
import 'package:seller/features/cart/data/model/order_model/order_model.dart';
import 'core/bloc_observer.dart';
import 'core/utils/app_routs.dart';
import 'core/utils/shared_prefrance.dart';
import 'features/cart/data/model/user_model/user_model.dart';
import 'firebase_options.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(OrderModelAdapter());
  await Hive.openBox<UserModel>(AssetDate.kUserBox);
  await CacheHelper.init();
  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
    if (user != null) {
      initialRoute = AppRouter.homeScreen;
    } else {
      initialRoute = AppRouter.loginScreen;
    }
  });

  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
