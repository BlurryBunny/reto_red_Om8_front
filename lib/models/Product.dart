import 'package:flutter/material.dart';

class Product {
  final String title;
  final String? category, description, image;
  final double price;
  final int id;
  
  // product from api
  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.id,
    required this.category,
  });

   Map<String, dynamic> toJson() => {
        'title': title,
        'category': category,
        'description': description,
        'image': image,
        'price': price,
        'id': id,
      };

  
  factory Product.fromJson(Map<String,dynamic> data){
     return Product(
      category: data['category'],
      image: data['image'],
      id: data['id'],
      title: data['title'],
      price: data['price'].toDouble(),
      description: data['description'],
     );
  }
}
