

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodpedia_app/data/datasources/food_remote_datasource.dart';
import 'package:foodpedia_app/data/models/food_response_model.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    on<GetFoodEvent>((event, emit) async {
     emit(FoodLoading());
      final result =
          await FoodRemoteDatasource().getFood();
      result.fold(
        (error) => emit(FoodError(message: error)),
        (success) => emit(FoodLoaded(foodResponse: success)),
      );
    });
  }
}
