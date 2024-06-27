import 'package:flutter/material.dart';
import 'package:hyper_ui/service/product_service/product_service.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/vn_product_list_view.dart';

class VnProductListController extends State<VnProductListView>
    implements MvcController {
  static late VnProductListController instance;
  late VnProductListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doDelete(String id) async {
    ProductService.delete(id);
  }
}
