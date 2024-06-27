import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/welcome_controller.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({Key? key}) : super(key: key);

  Widget build(context, WelcomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<WelcomeView> createState() => WelcomeController();
}