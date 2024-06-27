import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class VendorProfileController extends State<VendorProfileView>
    implements MvcController {
  static late VendorProfileController instance;
  late VendorProfileView view;

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
  String? restoName;
  String? address;
  double? latitude;
  double? longitude;

  setRestoProfile(Map item) {
    photo = item["photo"];
    restoName = item["resto_name"];
    address = item["address"];
    latitude = item["latitude"];
    longitude = item["longitude"];
  }

  doSave() async {
    await RestoService.save(
      photo: photo!,
      restoName: restoName!,
      address: address!,
      latitude: latitude!,
      longitude: longitude!,
    );
    showInfoDialog("Berhasil menyimpan data");
  }
}
