import 'package:guanare_market/src/utils/get_assets.dart' show getIcon;

class Menu {
  const Menu({required this.title, required this.icon});

  final String title, icon;
}

final links = <Menu>[
  Menu(
    title: 'Productos',
    icon: getIcon('shopping-bag'),
  ),
  Menu(
    title: 'Pasos para comprar',
    icon: getIcon('check-circle'),
  ),
  Menu(
    title: 'Pasos para vender',
    icon: getIcon('check-square'),
  ),
  Menu(
    title: 'Donaciones',
    icon: getIcon('gift'),
  ),
  Menu(
    title: '¿Quienes somos?',
    icon: getIcon('users'),
  ),
];
