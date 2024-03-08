part of 'product_create_bloc.dart';

@immutable
sealed class ProductCreateEvent {}

class DoCreateProduct extends ProductCreateEvent {
  final ProductCreateRequestModel model;

  DoCreateProduct(this.model);
}

