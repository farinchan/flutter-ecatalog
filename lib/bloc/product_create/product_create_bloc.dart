import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/datasources/products_datasources.dart';
import 'package:flutter_ecatalog/data/models/request/product_create_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/product_create_response_model.dart';
import 'package:meta/meta.dart';

part 'product_create_event.dart';
part 'product_create_state.dart';

class ProductCreateBloc extends Bloc<ProductCreateEvent, ProductCreateState> {
  final ProductDatasource dataSource;
  ProductCreateBloc(this.dataSource) : super(ProductCreateInitial()) {
    on<DoCreateProduct>((event, emit) async {
      // TODO: implement event handler
      emit(ProductCreateLoading());
      final result = await dataSource.createProduct(event.model);
      result.fold(
        (l) {
          emit(ProductCreateError(l));
        },
        (r) {
          emit(ProductCreateLoaded(r));
        },
      );
    });
  }
}
