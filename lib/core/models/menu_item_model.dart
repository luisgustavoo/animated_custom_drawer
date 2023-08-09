class MenuItemModel {
  MenuItemModel({
    required this.id,
    required this.description,
    required this.onTap,
  });

  final int id;
  final String description;
  final Function(int index) onTap;
}
