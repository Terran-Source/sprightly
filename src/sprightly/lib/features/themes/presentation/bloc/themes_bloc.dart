library sprightly.feature.themes_bloc;

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'themes_event.dart';
part 'themes_state.dart';

class ThemesBloc extends Bloc<ThemesEvent, ThemesState> {
  ThemesBloc({ThemesState initialState})
      : super(initialState ?? ThemesInitial());

  @override
  Stream<ThemesState> mapEventToState(
    ThemesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
