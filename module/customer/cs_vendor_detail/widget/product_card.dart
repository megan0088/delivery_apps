// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:hyper_ui/module/customer/cs_vendor_detail/controller/cs_vendor_detail_controller.dart';

class ProductCard extends StatelessWidget {
  final Map item;
  const ProductCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CsVendorDetailController controller = CsVendorDetailController.instance;

    return Padding(
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
                  item["product_name"],
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["category"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10.0,
                            ),
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
                    const SizedBox(
                      width: 4.0,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.grey[800]!,
                            ),
                          ),
                          child: InkWell(
                            onTap: () => controller.decreaseQty(item),
                            child: Icon(
                              Icons.remove,
                              size: 20.0,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "${controller.getQty(item)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                            border: Border.all(
                              width: 1.0,
                              color: Colors.grey[800]!,
                            ),
                          ),
                          child: InkWell(
                            onTap: () => controller.increaseQty(item),
                            child: Icon(
                              Icons.add,
                              size: 20.0,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
