import 'package:bloc/bloc.dart';

class AppBarCubit extends Cubit<double> {
  AppBarCubit() : super(0.0);

  void setOffset(double scrollOffset) => emit(scrollOffset);
}
