import 'package:animated_custom_drawer/app/cubit/app_cubit.dart';

extension MenuItemExtension on MenuItems {
  String get toMenuItem {
    final menuItemName = name.split(RegExp(r"(?=[A-Z])"));
    final firsName =
        '${menuItemName.first.substring(0, 1).toUpperCase()}${menuItemName.first.substring(1).toLowerCase()}';
    final lastName =
        '${menuItemName.last.substring(0, 1).toUpperCase()}${menuItemName.last.substring(1).toLowerCase()}';
    return '$firsName $lastName';
  }
}
