import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class VnProductListView extends StatefulWidget {
  const VnProductListView({Key? key}) : super(key: key);

  Widget build(context, VnProductListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("VnProductList"),
        actions: const [],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Get.to(const VnProductFormView());
        },
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("products")
                    .where("owner.uid",
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Error");
                  if (snapshot.data == null) return Container();
                  if (snapshot.data!.docs.isEmpty) {
                    return const Text("No Data");
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> item =
                          (data.docs[index].data() as Map<String, dynamic>);
                      item["id"] = data.docs[index].id;
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (detail) {},
                        confirmDismiss: (direction) async {
                          bool confirm = false;
                          await showDialog<void>(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirm'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const <Widget>[
                                      Text(
                                          'Are you sure you want to delete this item?'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey[600],
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("No"),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueGrey,
                                    ),
                                    onPressed: () {
                                      confirm = true;
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Yes"),
                                  ),
                                ],
                              );
                            },
                          );
                          if (confirm) {
                            controller.doDelete(item["id"]);
                            return Future.value(true);
                          }
                          return Future.value(false);
                        },
                        child: Card(
                          child: ListTile(
                            onTap: () async {
                              await Get.to(VnProductFormView(
                                item: item,
                              ));
                            },
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(item["photo"]),
                            ),
                            title: Text(item["product_name"]),
                            subtitle: Text("${item["price"]}"),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<VnProductListView> createState() => VnProductListController();
}
