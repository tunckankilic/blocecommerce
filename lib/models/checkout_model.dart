// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:blocecommerce/models/models.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? city;
  final String? address;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subTotal;
  final String? deliveryFee;
  final String? total;
  const Checkout(Map<Object?, Object?> map, {
    this.fullName,
    this.email,
    this.city,
    this.address,
    this.country,
    this.zipCode,
    this.products,
    this.subTotal,
    this.deliveryFee,
    this.total,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        city,
        address,
        country,
        zipCode,
        products,
        subTotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    Map<String, Object> customerAddress = {};
    customerAddress["address"] = address!;
    customerAddress["city"] = city!;
    customerAddress["country"] = country!;
    customerAddress["zipCode"] = zipCode!;

    return {
      "customerAddress": customerAddress,
      "customerName": fullName!,
      "customerEmail": email!,
      "products": products!.map((e) => e.name).toList(),
      "subTotal": subTotal!,
      "deliveryFee": deliveryFee!,
      "total": total!,
    };
  }
}
