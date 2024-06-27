import 'package:flutter/material.dart';
import 'package:hyper_ui/service/product_service/product_service.dart';
import 'package:hyper_ui/state_util.dart';
import '../view/vn_product_form_view.dart';

class VnProductFormController extends State<VnProductFormView>
    implements MvcController {
  static late VnProductFormController instance;
  late VnProductFormView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      uid = widget.item!["id"];
      photo = widget.item!["photo"];
      productName = widget.item!["product_name"];
      price = widget.item!["price"];
      category = widget.item!["category"];
      description = widget.item!["description"];
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool get isEditMode {
    return widget.item != null;
  }

  String? uid;
  String? photo;
  String? productName;
  double? price;
  String? category;
  String? description;

  doSave() async {
    if (isEditMode) {
      await ProductService.updateProduct(
        id: uid!,
        photo: photo!,
        productName: productName!,
        price: price!,
        category: category!,
        description: description!,
      );
    } else {
      await ProductService.addProduct(
        photo: photo!,
        productName: productName!,
        price: price!,
        category: category!,
        description: description!,
      );
    }

    Get.back();
  }
}
