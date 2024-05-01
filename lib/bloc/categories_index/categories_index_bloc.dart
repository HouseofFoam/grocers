import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_index_event.dart';
part 'categories_index_state.dart';

class CategoriesIndexBloc
    extends Bloc<CategoriesIndexEvent, CategoriesIndexState> {
  CategoriesIndexBloc() : super(const CategoriesIndexInitial()) {
    on<ChangeIndexEvent>((event, emit) {
      emit(CategoriesIndexInitial(index: event.newIndex));
    });
  }
}
