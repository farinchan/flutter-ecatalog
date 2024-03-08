import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/datasources/products_datasources.dart';
import 'package:flutter_ecatalog/data/models/response/product_all_response_model.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductDatasource datasource;
  ProductsBloc(this.datasource) : super(ProductsInitial()) {
    on<GetProductsAll>((event, emit) async {
      emit(ProductsLoading());
      // TODO: implement event handler
        final result = await datasource.getAllProducts();
        result.fold(
          (l) => emit(ProductsError(l)),
          (r) => emit(ProductsLoaded(r)),
        );
    });
  }
}
