import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/adm_dashboard_controller.dart';

class AdmDashboardView extends StatefulWidget {
  const AdmDashboardView({Key? key}) : super(key: key);

  Widget build(context, AdmDashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("AdmDashboard"),
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
  State<AdmDashboardView> createState() => AdmDashboardController();
}