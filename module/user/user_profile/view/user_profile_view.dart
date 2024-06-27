import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  Widget build(context, UserProfileController controller) {
    controller.view = this;

    return StreamBuilder<DocumentSnapshot<Object?>>(
      stream: FirebaseFirestore.instance
          .collection("users")
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
        controller.setUserProfile(item);

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
                          Icons.person,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "User Profile",
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
                      label: "Full Name",
                      validator: Validator.required,
                      value: item["name"],
                      onChanged: (value) {
                        controller.name = value;
                      },
                    ),
                    QTextField(
                      label: "Email",
                      validator: Validator.required,
                      value: item["email"],
                      enabled: false,
                      onChanged: (value) {},
                    ),
                    QTextField(
                      label: "Role",
                      validator: Validator.required,
                      value: item["role"],
                      enabled: false,
                      onChanged: (value) {
                        controller.role = value;
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
  State<UserProfileView> createState() => UserProfileController();
}
