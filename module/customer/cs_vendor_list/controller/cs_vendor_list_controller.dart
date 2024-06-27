import 'package:flutter/material.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/cs_vendor_list_view.dart';

class CsVendorListController extends State<CsVendorListView>
    implements MvcController {
  static late CsVendorListController instance;
  late CsVendorListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  String search = "";
}
