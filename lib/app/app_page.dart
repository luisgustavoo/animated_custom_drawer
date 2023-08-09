import 'package:animated_custom_drawer/app/cubit/app_cubit.dart';
import 'package:animated_custom_drawer/core/extentions/menu_item_extension.dart';
import 'package:animated_custom_drawer/core/models/menu_item_model.dart';
import 'package:animated_custom_drawer/core/widgets/menu_widget.dart';
import 'package:animated_custom_drawer/modules/page_one/page_one.dart';
import 'package:animated_custom_drawer/modules/page_three/page_three.dart';
import 'package:animated_custom_drawer/modules/page_two/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuWidget(
      listOfItems: MenuItems.values.map(
        (menuItem) {
          return MenuItemModel(
            id: menuItem.index,
            description: menuItem.toMenuItem,
            onTap: (item) {
              context.read<AppCubit>().changePage(menuItem);
            },
          );
        },
      ).toList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              context.read<AppCubit>().toggleMenu();
            },
          ),
        ),
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return IndexedStack(
              index: state.indexPage(state.appPages),
              children: const [
                PageOne(),
                PageTwo(),
                PageThree(),
              ],
            );
          },
        ),
      ),
    );
  }
}
