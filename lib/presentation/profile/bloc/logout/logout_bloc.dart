

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/data/datasources/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutUserEvent>((event, emit) async {
      emit(LogoutLoading());
      final result =
          await AuthRemoteDatasource().logout();
      result.fold(
        (error) => emit(LogoutError(message: error)),
        (success) => emit(LogoutLoaded(message: success)),
      );
    });
  }
}
