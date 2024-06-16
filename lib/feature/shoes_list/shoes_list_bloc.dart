import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/feature/shoes_list/shoes_service.dart';

import 'model/shoes_model.dart';

// Define the events for the Bloc
abstract class ShoesBaseEvent {}

class FetchShoesEvent extends ShoesBaseEvent {}

// Define the states for the Bloc
abstract class ShoesState {}

class ShoesInitial extends ShoesState {}

class ShoesLoaded extends ShoesState {
  final ShoesModel? model;

  ShoesLoaded(this.model);
}

class ShoesBloc extends Bloc<ShoesBaseEvent, ShoesState> {
  final ShoesService _shoesService;
  ShoesBloc()
      : _shoesService = ShoesService(),
        super(ShoesInitial()) {
    on<FetchShoesEvent>(
      (event, emit) async {
        final model = await _shoesService.fetchShoesList();
        print(model);
        emit(ShoesLoaded(model));
      },
    );
  }
}
