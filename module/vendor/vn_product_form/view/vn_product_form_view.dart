import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class VnProductFormView extends StatefulWidget {
  final Map? item;
  const VnProductFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, VnProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("VnProductForm"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      QImagePicker(
                        label: "Photo",
                        validator: Validator.required,
                        value: controller.photo,
                        onChanged: (value) {
                          controller.photo = value;
                        },
                      ),
                      QTextField(
                        label: "Product name",
                        validator: Validator.required,
                        value: controller.productName,
                        onChanged: (value) {
                          controller.productName = value;
                        },
                      ),
                      QNumberField(
                        label: "Price",
                        validator: Validator.required,
                        value: controller.price?.toString(),
                        onChanged: (value) {
                          controller.price = double.tryParse(value) ?? 0;
                        },
                      ),

//Buatlah List<String> category Food di restoran
                      QDropdownField(
                        label: "Category",
                        validator: Validator.required,
                        value: controller.category,
                        items: const [
                          {
                            "label": "Appetizers",
                            "value": "Appetizers",
                          },
                          {
                            "label": "Salads",
                            "value": "Salads",
                          },
                          {
                            "label": "Soups",
                            "value": "Soups",
                          },
                          {
                            "label": "Main Course",
                            "value": "Main Course",
                          },
                          {
                            "label": "Desserts",
                            "value": "Desserts",
                          }
                        ],
                        onChanged: (value, label) {
                          controller.category = value;
                        },
                      ),
                      QMemoField(
                        label: "Description",
                        validator: Validator.required,
                        value: controller.description,
                        onChanged: (value) {
                          controller.description = value;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
          ),
          onPressed: () => controller.doSave(),
          child: Text(
            "Save",
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<VnProductFormView> createState() => VnProductFormController();
}
