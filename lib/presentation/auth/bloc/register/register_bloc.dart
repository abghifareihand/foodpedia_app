import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/data/datasources/auth_remote_datasource.dart';
import 'package:foodpedia_app/data/models/auth_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegisterLoading());
      final result =
          await AuthRemoteDatasource().register(event.name, event.email, event.password);
      result.fold(
        (error) => emit(RegisterError(message: error)),
        (success) => emit(RegisterLoaded(userResponse: success)),
      );
    });
  }
}
