

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/data/datasources/auth_remote_datasource.dart';
import 'package:foodpedia_app/data/models/response/auth_response_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
     emit(UserLoading());
      final result =
          await AuthRemoteDatasource().getUserById(event.userId);
      result.fold(
        (error) => emit(UserError(message: error)),
        (success) => emit(UserLoaded(userResponse: success)),
      );
    });
  }
}
