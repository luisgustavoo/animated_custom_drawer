import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());

  void toggleMenu() {
    emit(
      state.copyWith(
        menuApp: state.menuApp.isOpen ? AppMenu.close : AppMenu.open,
      ),
    );
  }

  void changePage(MenuItems page) {
    emit(
      state.copyWith(
        appPages: page,
      ),
    );
    toggleMenu();
  }
}
