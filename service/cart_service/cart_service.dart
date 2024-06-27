class CartService {
  static List products = [];

  static increaseQty(Map product) {
    var index = products.indexWhere((i) => i["id"] == product["id"]);
    if (index == -1) {
      product["qty"] = 1;
      products.add(product);
    } else {
      var oldProduct = products[index];
      product["qty"] = oldProduct["qty"] + 1;
      products[index] = product;
    }
  }

  static decreaseQty(Map product) {
    var index = products.indexWhere((i) => i["id"] == product["id"]);
    if (index != -1) {
      var oldProduct = products[index];
      product["qty"] = oldProduct["qty"] - 1;
      products[index] = product;
    }
  }

  static getQty(Map product) {
    var index = products.indexWhere((i) => i["id"] == product["id"]);
    if (index == -1) return 0;
    var oldProduct = products[index];
    return oldProduct["qty"];
  }

  static clearCart() {
    products.clear();
  }

  static double get total {
    var total = 0.0;
    for (var product in products) {
      total += (product["qty"] ?? 0) * product["price"];
    }
    return total;
  }
}
