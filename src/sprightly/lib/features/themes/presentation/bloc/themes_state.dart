part of sprightly.feature.themes_bloc;

abstract class ThemesState extends Equatable {
  const ThemesState();
}

class ThemesInitial extends ThemesState {
  @override
  List<Object> get props => [];
}
