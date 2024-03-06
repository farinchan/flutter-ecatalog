import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/register_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/register_response_model.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDataSource dataSource;
  RegisterBloc(
    this.dataSource
  ) : super(RegisterInitial()) {
    on<DoRegisterEvent>((event, emit) async {
      // TODO: implement event handler
      emit(RegisterLoading());
      final result = await dataSource.register(event.model);
      result.fold(
        (l) {
          emit(RegisterError(l));
        },
        (r) {
          emit(RegisterLoaded(r));
        },
      );
    });
  }
}
