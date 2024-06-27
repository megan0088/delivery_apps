// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class RestoCard extends StatelessWidget {
  final Map item;
  const RestoCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.to(CsVendorDetailView(
          resto: item,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    item["photo"],
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12.0),
                ),
                color: Colors.blue[400],
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.green[800],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          12.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Top 5",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    item["resto_name"],
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 12.0,
                        color: primaryColor,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        item["address"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10.0,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "8.1 km",
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      const Icon(
                        Icons.circle,
                        size: 4.0,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange[400],
                        size: 16.0,
                      ),
                      const Text(
                        "4.8",
                        style: TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const Text(
                    "€24",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
