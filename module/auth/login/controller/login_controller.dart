import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doLoginAsCustomer() async {
    bool isLoggedIn = await AuthService.doGoogleLogin(
      role: "Customer",
    );
    if (isLoggedIn) {
      Get.offAll(const CsMainNavigationView());
    }
  }

  doLoginAsDriver() async {
    bool isLoggedIn = await AuthService.doGoogleLogin(
      role: "Driver",
    );
    if (isLoggedIn) {
      Get.offAll(const DrMainNavigationView());
    }
  }

  doLoginAsAdmin() async {
    bool isLoggedIn = await AuthService.doGoogleLogin(
      role: "Admin",
    );
    if (isLoggedIn) {
      Get.offAll(const AdmMainNavigationView());
    }
  }

  doLoginAsResto() async {
    bool isLoggedIn = await AuthService.doGoogleLogin(
      role: "Vendor",
    );
    if (isLoggedIn) {
      Get.offAll(const VnMainNavigationView());
    }
  }
}
