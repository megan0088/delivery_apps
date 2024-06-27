import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/cs_order_list_controller.dart';

class CsOrderListView extends StatefulWidget {
  const CsOrderListView({Key? key}) : super(key: key);

  Widget build(context, CsOrderListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("CsOrderList"),
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
  State<CsOrderListView> createState() => CsOrderListController();
}