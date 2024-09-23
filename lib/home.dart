import 'package:flutter/material.dart';
import 'package:restaurant/components/color_button.dart';
import 'package:restaurant/components/theme_button.dart';
import 'package:restaurant/constants.dart';
import 'components/category_card.dart';
import 'models/food_category.dart';
import 'components/post_card.dart';
import 'models/post.dart';
import 'components/restaurant_landscape_card.dart';
import 'models/restaurant.dart';


class Home extends StatefulWidget {
  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;

  const Home(
      {super.key,
      required this.changeTheme,
      required this.changeColor,
      required this.colorSelected});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Category',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Post',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Restaurant',
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: 'Fish',
      selectedIcon: Icon(Icons.credit_card),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //TODO:Define pages
    final pages=[
      Center(
        child: ConstrainedBox(
          constraints:const BoxConstraints(maxWidth: 300),
          child: CategoryCard(category: categories[0]),),
      ),

      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: PostCard(post: posts[0]),
        ),
      ),

      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: RestaurantLandscapeCard(restaurant: restaurants[0]),),
      ),

      
      //TODO:Replace with fish card
      Container(color: Colors.grey[400]),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme,
          ),
          ColorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.colorSelected,
          ),
        ],
      ),
      
     body: IndexedStack(
      index: tab,
      children:pages,
     ),
      // TODO: Add bottom navigation bar
      bottomNavigationBar: NavigationBar(
        // 2
        selectedIndex: tab,
        // 3
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
        // 4
        destinations: appBarDestinations,
      ),
    );
  }
}
