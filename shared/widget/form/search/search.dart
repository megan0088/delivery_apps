// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class QSearchField extends StatelessWidget {
  final Function(String value) onSubmitted;
  final String label;

  const QSearchField({
    Key? key,
    this.label = "Search",
    required this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.grey[500],
            ),
          ),
          Expanded(
            child: TextFormField(
              initialValue: null,
              decoration: InputDecoration.collapsed(
                filled: true,
                fillColor: Colors.transparent,
                hintText: label,
                hintStyle: TextStyle(
                  color: Colors.grey[500],
                ),
                hoverColor: Colors.transparent,
              ),
              onFieldSubmitted: (value) {
                onSubmitted(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
