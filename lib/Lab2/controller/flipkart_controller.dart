import 'package:adv_flutter_lab/Lab2/model/e_commerce_model.dart';

class ProductController {
  List<ProductModel> getProducts() {
    return ProductModel.getProducts();
  }
}