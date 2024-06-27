import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/cs_cart_view.dart';

class CsCartController extends State<CsCartView> implements MvcController {
  static late CsCartController instance;
  late CsCartView view;

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