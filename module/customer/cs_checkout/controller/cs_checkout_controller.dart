import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/cs_checkout_view.dart';

class CsCheckoutController extends State<CsCheckoutView> implements MvcController {
  static late CsCheckoutController instance;
  late CsCheckoutView view;

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