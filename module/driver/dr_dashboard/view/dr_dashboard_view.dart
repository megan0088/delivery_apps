import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/dr_dashboard_controller.dart';

class DrDashboardView extends StatefulWidget {
  const DrDashboardView({Key? key}) : super(key: key);

  Widget build(context, DrDashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("DrDashboard"),
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
  State<DrDashboardView> createState() => DrDashboardController();
}