import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hyper_ui/core.dart';

class CsDashboardView extends StatefulWidget {
  const CsDashboardView({Key? key}) : super(key: key);

  Widget build(context, CsDashboardController controller) {
    controller.view = this;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: !controller.appBarVisibility
          ? null
          : AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.location_on,
                          size: 16.0,
                        ),
                        Text(
                          "California, US",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Icon(
                          Ionicons.chevron_down,
                          size: 16.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Ionicons.notifications_outline,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Ionicons.bag_handle,
                  ),
                ),
              ],
            ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Container(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: 280,
                  color: primaryColor,
                  child: SafeArea(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Hi Andrea",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  "Hungry? Order & Eat.",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 24,
                                  offset: Offset(0, 11),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Ionicons.search,
                              size: 32.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                transform: Matrix4.translationValues(0.0, -130, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 120.0,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: const EdgeInsets.only(
                              right: 12.0,
                            ),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://images.unsplash.com/photo-1533050487297-09b450131914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  16.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Main Categories",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    const Text(
                      "Food delivery services in over the world",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    //ALT+SHIFT+H
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      controller: ScrollController(),
                      child: Row(
                        children: List.generate(10, (index) {
                          return Container(
                            height: 180.0,
                            width: 120.0,
                            margin: const EdgeInsets.only(
                              right: 12.0,
                              bottom: 16.0,
                              top: 16.0,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(32.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 24,
                                  offset: Offset(0, 11),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 120.0,
                                  height: 100.0,
                                  child: SvgPicture.asset(
                                    "assets/svg/main_shape.svg",
                                    semanticsLabel: 'A red up arrow',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        CircleAvatar(
                                          radius: 32.0,
                                          backgroundColor: successColor,
                                          child: Image.network(
                                            "https://icons.iconarchive.com/icons/kzzu/i-love-you/256/Coffee-icon.png",
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        const Text(
                                          "Restaurant",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 12.0,
                                        ),
                                        CircleAvatar(
                                          radius: 16.0,
                                          backgroundColor: successColor,
                                          child: const Icon(
                                            Ionicons.chevron_forward,
                                            size: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      "Last time visited",
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
                        children: List.generate(10, (index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            padding: const EdgeInsets.all(12.0),
                            margin: const EdgeInsets.only(
                              right: 12.0,
                              bottom: 16.0,
                              top: 16.0,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 24,
                                  offset: Offset(0, 11),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 60.0,
                                  width: 60.0,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://images.unsplash.com/photo-1533050487297-09b450131914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        16.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Pizza King",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      const Text(
                                        "Mc Donald, New york, USA",
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Icon(
                                            Ionicons.star,
                                            size: 12.0,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            "4.9",
                                            style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4.0,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              "15 USD",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          CircleAvatar(
                                            radius: 10.0,
                                            backgroundColor: successColor,
                                            child: const Icon(
                                              Ionicons.bag,
                                              color: Colors.white,
                                              size: 10.0,
                                            ),
                                          ),
                                        ],
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
                    const NearByPopularFood(),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Favorite Resto",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.to(const CsVendorListView()),
                          child: const Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("vendors")
                          .limit(5)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) return const Text("Error");
                        if (snapshot.data == null) return Container();
                        if (snapshot.data!.docs.isEmpty) {
                          return const Text("No Data");
                        }
                        final data = snapshot.data!;
                        return ListView.builder(
                          itemCount: data.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> item = (data.docs[index].data()
                                as Map<String, dynamic>);
                            item["id"] = data.docs[index].id;
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 90,
                                      margin:
                                          const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            item["photo"],
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
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
                                              borderRadius:
                                                  const BorderRadius.all(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                            "Bakery & Cake . Breakfast . Snack",
                                            style: TextStyle(
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
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<CsDashboardView> createState() => CsDashboardController();
}
