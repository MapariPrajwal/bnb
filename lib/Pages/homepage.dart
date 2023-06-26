import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../Components/cartpage.dart';
import '../Components/favpage.dart';
import '../Components/notifypage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int notificationCount = 0;
  int cartCount = 0;
  int favoritesCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      NotificationsScreen(
        count: notificationCount,
        incrementCount: () {
          setState(() {
            notificationCount++;
          });
        },
        decrementCount: () {
          setState(() {
            if (notificationCount > 0) {
              notificationCount--;
            }
          });
        },
      ),
      CartScreen(
        count: cartCount,
        incrementCount: () {
          setState(() {
            cartCount++;
          });
        },
        decrementCount: () {
          setState(() {
            if (cartCount > 0) {
              cartCount--;
            }
          });
        },
      ),
      FavoritesScreen(
        count: favoritesCount,
        incrementCount: () {
          setState(() {
            favoritesCount++;
          });
        },
        decrementCount: () {
          setState(() {
            if (favoritesCount > 0) {
              favoritesCount--;
            }
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: 'Notifications',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.shopping_cart,
          color: Colors.white,
          ),
        title: 'Cart',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: 'Favorites',
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
