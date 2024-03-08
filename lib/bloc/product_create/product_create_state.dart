part of 'product_create_bloc.dart';

@immutable
sealed class ProductCreateState {}

final class ProductCreateInitial extends ProductCreateState {}

final class ProductCreateLoading extends ProductCreateState {}

final class ProductCreateError extends ProductCreateState {
  final String message;

  ProductCreateError(this.message);
}

final class ProductCreateLoaded extends ProductCreateState {
  final ProductCreateResponseModel model;

  ProductCreateLoaded(this.model);
}
