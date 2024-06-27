import 'package:hyper_ui/state_util.dart';
import 'package:hyper_ui/core.dart';
import 'package:flutter/material.dart';

void main() async {
  await initialize();

  // Get.mainTheme.value = getDefaultTheme();
  // Get.mainTheme.value = getDarkTheme();
  runMainApp();
}

runMainApp() async {
  return runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Get.mainTheme,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Capek Ngoding',
          navigatorKey: Get.navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: getDefaultTheme(),
          home: const LoginView(),
        );
      },
    );
  }
}
