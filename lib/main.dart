import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'core/constants/constants.dart';
import 'core/routes/routes.dart';
import 'core/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final initialRoute = await RoutesConsts.initialRoute;
  runApp(Dash(initialRoute: initialRoute));
}

class Dash extends StatelessWidget {
  final String initialRoute;
  const Dash({required this.initialRoute});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Encom Energia',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.theme(),
      initialRoute: initialRoute,
      getPages: Routes.pages,
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [
        const Locale('pt'),
      ],
    );
  }
}
