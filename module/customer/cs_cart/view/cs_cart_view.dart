import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/cs_cart_controller.dart';

class CsCartView extends StatefulWidget {
  const CsCartView({Key? key}) : super(key: key);

  Widget build(context, CsCartController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CsCart"),
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
  State<CsCartView> createState() => CsCartController();
}