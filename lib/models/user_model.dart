// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String fullName;
  final String email;
  final String address;
  final String city;
  final String country;
  final String zipCode;

  const User({
    this.id,
    this.fullName = "",
    this.email = "",
    this.address = "",
    this.city = "",
    this.country = "",
    this.zipCode = "",
  });

  @override
  List<Object?> get props {
    return [
      id,
      fullName,
      email,
      address,
      city,
      country,
      zipCode,
    ];
  }

  User copyWith({
    String? id,
    String? fullName,
    String? email,
    String? address,
    String? city,
    String? country,
    String? zipCode,
  }) {
    return User(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  Map<String, dynamic> toDocument() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'address': address,
      'city': city,
      'country': country,
      'zipCode': zipCode,
    };
  }

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    return User(
      id: snapshot.id,
      fullName: snapshot['fullName'] as String,
      email: snapshot['email'] as String,
      address: snapshot['address'] as String,
      city: snapshot['city'] as String,
      country: snapshot['country'] as String,
      zipCode: snapshot['zipCode'] as String,
    );
  }

  @override
  bool get stringify => true;
}
