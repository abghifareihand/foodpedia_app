import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/data/datasources/auth_remote_datasource.dart';
import 'package:foodpedia_app/data/models/response/auth_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUserEvent>((event, emit) async {
      emit(LoginLoading());
      final result =
          await AuthRemoteDatasource().login(event.email, event.password);
      result.fold(
        (error) => emit(LoginError(message: error)),
        (success) => emit(LoginLoaded(userResponse: success)),
      );
    });
  }
}
