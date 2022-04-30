import 'package:flutter/material.dart';
import 'package:tringconnect/utils/app-constants.dart';
import 'package:tringconnect/utils/app-router.dart';
import 'package:tringconnect/utils/colors.dart';

void main() {
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

