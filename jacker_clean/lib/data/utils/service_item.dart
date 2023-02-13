import 'package:flutter/material.dart';

class ServiceItem {
  ServiceItem({required this.name, required this.price, this.count = 0});

  final String name;
  final String price;
  int count;
}
