import 'package:animated_custom_drawer/app/cubit/app_cubit.dart';
import 'package:animated_custom_drawer/core/models/menu_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    required this.listOfItems,
    required this.child,
    super.key,
  });

  final List<MenuItemModel> listOfItems;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        Widget widget = child;
        var top = 0.0;
        var left = 0.0;
        var bottom = 0.0;
        var right = 0.0;
        if (state.menuApp.isOpen) {
          top = 100;
          left = 200;
          bottom = 100;
          right -= 200;

          widget = ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                20,
              ),
            ),
            child: Material(
              elevation: 5,
              child: widget,
            ),
          );
        }
        return Stack(
          clipBehavior: Clip.none,
          children: [
            _MenuItensWidget(
              key: key,
              listOfItems: listOfItems,
            ),
            AnimatedPositioned(
              top: top,
              left: left,
              bottom: bottom,
              right: right,
              duration: const Duration(milliseconds: 200),
              child: widget,
            )
          ],
        );
      },
    );
  }
}

class _MenuItensWidget extends StatelessWidget {
  const _MenuItensWidget({
    required this.listOfItems,
    super.key,
  });
  final List<MenuItemModel> listOfItems;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        var left = -100.0;

        if (state.menuApp.isOpen) {
          left = 20.0;
        }

        return Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
            ),
            AnimatedPositioned(
              left: left,
              duration: const Duration(milliseconds: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: listOfItems.map((item) {
                  return TextButton(
                    onPressed: () {
                      item.onTap(item.id);
                    },
                    child: Text(
                      item.description,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        );
      },
    );
  }
}
