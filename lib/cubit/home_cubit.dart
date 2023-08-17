import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  var indexPage = 0;
  HomeCubit() : super(0);
  void selectIndex(int index) {
    indexPage = index;
    emit(indexPage);
  }
}
