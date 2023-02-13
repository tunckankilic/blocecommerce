// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final Cart? cart;
  final PaymentMethod? paymentMethod;

  const UpdateCheckout(
      {this.fullName,
      this.paymentMethod,
      this.email,
      this.address,
      this.city,
      this.country,
      this.zipCode,
      this.cart});

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        cart,
        paymentMethod,
      ];
}

class ConfirmCheckout extends CheckoutEvent {
  final Checkout checkout;
  const ConfirmCheckout({
    required this.checkout,
  });
  @override
  List<Object?> get props => [checkout];
}
