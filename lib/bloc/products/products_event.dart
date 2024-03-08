part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

class GetProductsAll extends ProductsEvent {}