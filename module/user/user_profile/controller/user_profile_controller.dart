import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class UserProfileController extends State<UserProfileView>
    implements MvcController {
  static late UserProfileController instance;
  late UserProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? photo;
  String? name;
  String? email;
  String? role;

  setUserProfile(Map item) {
    photo = item["photo"];
    name = item["name"];
    email = item["email"];
    role = item["role"];
  }

  doSave() async {
    await UserService.save(
      photo: photo!,
      name: name!,
      email: email!,
      role: role!,
    );
    showInfoDialog("Berhasil menyimpan data");
  }
}
