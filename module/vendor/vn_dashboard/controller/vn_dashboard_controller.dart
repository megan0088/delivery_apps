import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/vn_dashboard_view.dart';

class VnDashboardController extends State<VnDashboardView> implements MvcController {
  static late VnDashboardController instance;
  late VnDashboardView view;

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