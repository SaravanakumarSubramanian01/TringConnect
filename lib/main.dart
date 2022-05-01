import 'package:flutter/material.dart';
import 'package:tringconnect/utils/app-constants.dart';
import 'package:tringconnect/utils/app-router.dart';
import 'package:tringconnect/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TringConnect());
}

class TringConnect extends StatelessWidget {
  const TringConnect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: CustomColor.primaryGreen,
      ),
      initialRoute:RoutePaths.HOME,
      onGenerateRoute: AppRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

