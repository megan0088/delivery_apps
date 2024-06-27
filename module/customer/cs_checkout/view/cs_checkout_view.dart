import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/cs_checkout_controller.dart';

class CsCheckoutView extends StatefulWidget {
  const CsCheckoutView({Key? key}) : super(key: key);

  Widget build(context, CsCheckoutController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CsCheckout"),
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
  State<CsCheckoutView> createState() => CsCheckoutController();
}