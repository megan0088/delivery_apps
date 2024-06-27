import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Login"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/icon/icon.png",
                      width: 120.0,
                      height: 120.0,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 42.0,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.key,
                          color: secondaryColor,
                        ),
                        label: Text(
                          "Login as Customer",
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => controller.doLoginAsCustomer(),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      height: 42.0,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.key,
                          color: secondaryColor,
                        ),
                        label: Text(
                          "Login as Resto",
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => controller.doLoginAsResto(),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      height: 42.0,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.key,
                          color: secondaryColor,
                        ),
                        label: Text(
                          "Login as Driver",
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => controller.doLoginAsDriver(),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      height: 42.0,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton.icon(
                        icon: Icon(
                          Icons.key,
                          color: secondaryColor,
                        ),
                        label: Text(
                          "Login as Admin",
                          style: TextStyle(
                            color: secondaryColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () => controller.doLoginAsAdmin(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
