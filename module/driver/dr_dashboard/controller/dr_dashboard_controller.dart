import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/dr_dashboard_view.dart';

class DrDashboardController extends State<DrDashboardView> implements MvcController {
  static late DrDashboardController instance;
  late DrDashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}