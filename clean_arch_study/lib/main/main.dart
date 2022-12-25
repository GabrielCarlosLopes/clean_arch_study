import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../ui/components/components.dart';
import 'package:ForDev/main/factories/pages/login/login_page_factory.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return GetMaterialApp(
      title: '4Dev',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: makeLoginPage),
      ],
    );
  }
}
