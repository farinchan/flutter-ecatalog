import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';
import 'package:flutter_ecatalog/data/models/request/login_request_model.dart';
import 'package:flutter_ecatalog/data/models/response/login_response_model.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDataSource dataSource;
  LoginBloc(this.dataSource) : super(LoginInitial()) {
    on<DoLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final response = await dataSource.login(event.model);
      response.fold(
          (l) => emit(LoginError("Login Error")), (r) => emit(LoginLoaded(r)));
    });
  }
}
