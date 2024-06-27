// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyper_ui/shared/theme/theme.dart';

class ScaffoldImage extends StatelessWidget {
  final Widget body;
  final String title;
  final String? backgroundUrl;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  const ScaffoldImage({
    Key? key,
    required this.body,
    required this.title,
    this.actions,
    this.backgroundUrl,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Container(
          margin: const EdgeInsets.only(
            left: 12.0,
            top: 12.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: const BackButton(),
        ),
        actions: actions,
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  backgroundUrl ??
                      "https://images.unsplash.com/photo-1578474846511-04ba529f0b88?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
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
                  child: CircleAvatar(
                    radius: 32.0,
                    backgroundColor: primaryColor,
                    child: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/308/308556.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
