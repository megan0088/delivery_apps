// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyper_ui/core.dart';

class NearByPopularFood extends StatelessWidget {
  const NearByPopularFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = CsDashboardController.instance;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Near by Popular food",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          child: Row(
            children: List.generate(controller.products.length, (index) {
              var item = controller.products[index];
              return Container(
                width: 160.0,
                clipBehavior: Clip.antiAlias,
                margin: const EdgeInsets.only(
                  right: 12.0,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  item["photo"] ??
                                      "https://i.ibb.co/S32HNjD/no-image.jpg",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            right: 0,
                            child: SizedBox(
                              height: 42.0,
                              child: SvgPicture.asset(
                                "assets/svg/bottom_shape.svg",
                                semanticsLabel: 'A red up arrow',
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: const EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                  "https://icons.iconarchive.com/icons/martin-berube/people/256/chef-icon.png",
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: CircleAvatar(
                              radius: 16.0,
                              backgroundColor: primaryColor,
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Text(
                            "30%",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 4.0,
                          ),
                          const Expanded(
                            child: Text(
                              "Discount",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: successColor,
                            radius: 16.0,
                            child: const Icon(
                              Ionicons.bag,
                              color: Colors.white,
                              size: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
