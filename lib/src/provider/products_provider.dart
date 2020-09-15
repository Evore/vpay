import 'package:flutter/foundation.dart' as f;
import 'package:vpay/src/models/category.dart';
import 'package:vpay/src/provider/products_repo.dart';

class ProductsProvider extends f.ChangeNotifier {
  ProductsRepo repo = ProductsRepo();
  List<Category> categories = [];
  List<Product> products = [];

  ProductsProvider() {
    repo.getCategories().then((value) {
      setCategories(value);
    });
    repo.getProductsList().then((value) {
      setProducts(value);
    });
  }

  setProducts(List<Product> products) {
    this.products = products;
    notifyListeners();
  }

  setCategories(List<Category> categories) {
    this.categories = categories;
    notifyListeners();
  }

  List<Product> getProductsByCategory(String categoryName) {
    return products.where((product) {
      return product.category == categoryName;
    }).toList();
  }
}