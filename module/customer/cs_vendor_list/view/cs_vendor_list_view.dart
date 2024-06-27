import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/scaffold/scaffold_image.dart';
import 'package:hyper_ui/shared/widget/form/search/search.dart';

class CsVendorListView extends StatefulWidget {
  const CsVendorListView({Key? key}) : super(key: key);

  Widget build(context, CsVendorListController controller) {
    controller.view = this;

    return ScaffoldImage(
      title: "CsVendorList",
      backgroundUrl:
          "https://images.unsplash.com/photo-1578474846511-04ba529f0b88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Badge(
              backgroundColor: successColor,
              label: const Text(
                "4",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: const Icon(MdiIcons.shopping),
            ),
          ),
        ),
      ],
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            QSearchField(
              label: "What are you craving?",
              onSubmitted: (value) {
                controller.search = value;
                controller.setState(() {});
              },
            ),
            const SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: FireStream(
                stream: FirebaseFirestore.instance
                    .collection("vendors")
                    .snapshots(),
                itemBuilder: (item, index) {
                  if (controller.search.isNotEmpty) {
                    var search = controller.search.toLowerCase();
                    var restoName = item["resto_name"].toString().toLowerCase();
                    if (!restoName.contains(search)) return Container();
                  }
                  return RestoCard(item: item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<CsVendorListView> createState() => CsVendorListController();
}
