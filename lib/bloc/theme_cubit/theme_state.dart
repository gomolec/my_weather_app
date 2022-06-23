part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;

  const ThemeState(
    this.themeData,
  );

  @override
  List<Object> get props => [themeData];
}
