part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  final ThemeType type;

  const ThemeState({
    required this.themeData,
    required this.type,
  });

  @override
  List<Object> get props => [themeData, type];
}
