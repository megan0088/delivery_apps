// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FireStream extends StatelessWidget {
  final Stream<QuerySnapshot<Object?>>? stream;
  final Widget? Function(Map<String, dynamic>, int) itemBuilder;
  const FireStream({
    Key? key,
    required this.stream,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const Text("Error");
        if (snapshot.data == null) return Container();
        if (snapshot.data!.docs.isEmpty) {
          return const Text("No Data");
        }
        final data = snapshot.data!;
        return ListView.builder(
          itemCount: data.docs.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            Map<String, dynamic> item =
                (data.docs[index].data() as Map<String, dynamic>);
            item["id"] = data.docs[index].id;
            return itemBuilder(item, index);
          },
        );
      },
    );
  }
}
