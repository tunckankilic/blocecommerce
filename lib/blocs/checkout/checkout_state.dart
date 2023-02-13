// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String? fullName;
  final String? email;
  final String? city;
  final String? address;
  final String? country;
  final String? zipCode;
  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;
  final Checkout checkout;
  final PaymentMethod paymentMethod;
  CheckoutLoaded({
    this.paymentMethod = PaymentMethod.applePay,
    this.fullName,
    this.email,
    this.city,
    this.address,
    this.country,
    this.zipCode,
    this.products,
    this.subtotal,
    this.deliveryFee,
    this.total,
  }) : checkout = Checkout(
          fullName: fullName,
          email: email,
          city: city,
          address: address,
          country: country,
          zipCode: zipCode,
          products: products,
          subtotal: subtotal,
          deliveryFee: deliveryFee,
          total: total,
        );

  @override
  List<Object?> get props => [
        fullName,
        email,
        city,
        address,
        country,
        zipCode,
        products,
        subtotal,
        deliveryFee,
        paymentMethod,
        total,
      ];
}
