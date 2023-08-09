part of 'app_cubit.dart';

enum MenuItems { pageOne, pageTwo, pageThree }

enum MenuStatus {
  isOpen,
  isClose,
}

enum AppMenu {
  open(status: MenuStatus.isOpen),
  close(status: MenuStatus.isClose);

  const AppMenu({required this.status});
  final MenuStatus status;

  bool get isOpen => status == MenuStatus.isOpen;
}

class AppState extends Equatable {
  const AppState._({
    required this.menuApp,
    required this.appPages,
  });

  const AppState.initial()
      : this._(
          menuApp: AppMenu.close,
          appPages: MenuItems.pageOne,
        );

  final AppMenu menuApp;
  final MenuItems appPages;

  @override
  List<Object> get props => [menuApp, appPages];

  AppState copyWith({
    AppMenu? menuApp,
    MenuItems? appPages,
  }) {
    return AppState._(
      menuApp: menuApp ?? this.menuApp,
      appPages: appPages ?? this.appPages,
    );
  }

  int indexPage(MenuItems page) {
    return MenuItems.values.firstWhere((p) => p == page).index;

    // switch (page) {
    //   case AppPages.pageOne:
    //     return 0;
    //   case AppPages.pageTwo:
    //     return 1;
    //   case AppPages.pageThree:
    //     return 2;
    //   default:
    //     return 0;
    // }
  }
}
