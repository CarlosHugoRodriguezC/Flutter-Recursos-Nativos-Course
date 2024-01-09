import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}

class MainMenu extends StatelessWidget {
  MainMenu({super.key});

  final menuItems = <MenuItem>[
    MenuItem(
      title: 'Gyroscope',
      icon: Icons.downloading_outlined,
      route: '/gyroscope',
    ),
    MenuItem(
      title: 'Accelerometer',
      icon: Icons.speed_outlined,
      route: '/accelerometer',
    ),
    MenuItem(
      title: 'Magnetometer',
      icon: Icons.explore_outlined,
      route: '/magnetometer',
    ),
    MenuItem(
      title: 'Gyroscope Ball',
      icon: Icons.sports_baseball_outlined,
      route: '/gyroscope_ball',
    ),
    MenuItem(
      title: 'Compass',
      icon: Icons.explore_sharp,
      route: '/compass',
    ),
    MenuItem(
      title: "Pokemons",
      icon: Icons.catching_pokemon,
      route: '/pokemons',
    ),
    MenuItem(
      title: "Biometrics",
      icon: Icons.fingerprint,
      route: '/biometrics',
    ),
    MenuItem(
      title: "Location",
      icon: Icons.pin_drop,
      route: '/location',
    ),
    MenuItem(
      title: "Map",
      icon: Icons.map_outlined,
      route: '/map',
    ),
    MenuItem(
      title: "Maps",
      icon: Icons.gamepad_outlined,
      route: '/controlled-map',
    ),
    MenuItem(
      title: "Badge",
      icon: Icons.notification_add,
      route: '/badge',
    ),
    MenuItem(
      title: "Ad",
      icon: Icons.ad_units_outlined,
      route: '/ad-fullscreen',
    ),
    MenuItem(
      title: "Ad Rewarded",
      icon: Icons.fort_sharp,
      route: '/ad-rewarded',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: menuItems
          .map((item) => MainMenuItem(
                title: item.title,
                route: item.route,
                icon: item.icon,
              ))
          .toList(),
    );
  }
}

class MainMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;

  const MainMenuItem({
    super.key,
    required this.title,
    required this.route,
    required this.icon,
    this.bgColors = const [Colors.blue, Colors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(route);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: bgColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
