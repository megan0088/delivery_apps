import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class VendorProfileView extends StatefulWidget {
  const VendorProfileView({Key? key}) : super(key: key);

  Widget build(context, VendorProfileController controller) {
    controller.view = this;

    return StreamBuilder<DocumentSnapshot<Object?>>(
      stream: FirebaseFirestore.instance
          .collection("vendors")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text("Error");
        if (!snapshot.hasData) return const Text("No Data");

        Map<String, dynamic> item = {};
        if (snapshot.data?.data() != null) {
          item = ((snapshot.data?.data() ?? {}) as Map<String, dynamic>);
        }

        item["id"] = snapshot.data!.id;
        controller.setRestoProfile(item);

        return SingleChildScrollView(
          controller: ScrollController(),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.restaurant,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "Resto Profile",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    QImagePicker(
                      label: "Photo",
                      validator: Validator.required,
                      value: item["photo"],
                      onChanged: (value) {
                        controller.photo = value;
                      },
                    ),
                    QTextField(
                      label: "Resto Name",
                      validator: Validator.required,
                      value: item["resto_name"],
                      onChanged: (value) {
                        controller.restoName = value;
                      },
                    ),
                    QMemoField(
                      label: "Address",
                      validator: Validator.required,
                      value: item["address"],
                      onChanged: (value) {
                        controller.address = value;
                      },
                    ),
                    QLocationPicker(
                      id: "location",
                      latitude: item["latitude"] ?? -6.218481065235333,
                      longitude: item["longitude"] ?? 106.80254435779423,
                      onChanged: (latitude, longitude) {
                        controller.latitude = latitude;
                        controller.longitude = longitude;
                      },
                    ),
                    Container(
                      height: 64,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12.0),
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  State<VendorProfileView> createState() => VendorProfileController();
}
