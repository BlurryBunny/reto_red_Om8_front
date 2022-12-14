import 'dart:convert';

import 'package:reto_red_om8/models/Product.dart';
import 'package:http/http.dart' as http;
import 'package:reto_red_om8/models/cartUpdate.dart';

class ApiFakeStoreService {
  static const String baseUrl = 'https://fakestoreapi.com';
  static const headers = {'Content-type': 'application/json'};

  Future<List<Product>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    final productsApi = <Product>[];

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonData = json.decode(response.body);

      for (var product in jsonData) {
        productsApi.add(Product.fromJson(product));
        print(product);
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }

    print('Productos encontrados');
    print(productsApi);
    return productsApi;
  }

  Future<Product?> getProduct(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/products/$id'));

    final Product product;
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonData = json.decode(response.body);
      product = Product.fromJson(jsonData);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }

    print('Ya encontre');
    print(product);
    return product;
  }



  Future<CartUpdate> getCart(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/carts/$id'));
      final CartUpdate carrito;
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonData = json.decode(response.body);
      carrito= CartUpdate.fromJson(jsonData);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Cart ');
    }

    return carrito;
  }

  Future<void> updateCart(int userId, int productId) async {
    // final carrito= CartUpdate(userId: userId, date: DateTime.now(), products: []);
    final carrito  = CartUpdate(userId: userId, date: DateTime.now(), products: [{'productId':productId,'quantity':1}]);
    final response = await http.put(Uri.parse('$baseUrl/carts/$userId'),body:json.encode(carrito.toJson()),headers:headers);
      
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final jsonData = json.decode(response.body);
      print(jsonData);
      
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Cart ');
    }

  }
}
