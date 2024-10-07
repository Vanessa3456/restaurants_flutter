import 'package:flutter/material.dart';

import '../components/restaurant_item.dart';
import '../models/cart_manager.dart';
import '../models/order_manager.dart';
import '../models/restaurant.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant restaurant;
  // final CartManager cartManager;
  // final OrderManager ordersManager;

  const RestaurantPage({
    super.key,
    required this.restaurant,
    // required this.cartManager,
    // required this.ordersManager,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  //TODO:Add desktop threshold
  static const desktopThreshold =
      700; //used to determine whether to adapt the restaurant menu layout to big or small screens
  //TODO:Add constraints properties
  //TODO:Calcualate constrained width
  //TODO:Add calculate column count//you need to calculate the number of columns based on the screnns width
  int calculateColumnCount(double screenWidth) {
    return screenWidth > desktopThreshold
        ? 2
        : 1; //depending on the screnns width,the func returns eitheir 2 or 1
  }

  //TODO:Build custom scroll view
  CustomScrollView _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        //TODO:Add a silver app bar
        _buildSilverAppBar(),
        // SliverToBoxAdapter(
        //   child: Container(
        //     height: 200.0,
        //     color: Colors.red,
        //   ),
        // ),
        //TODO:Add restaurant info session
        _buildInfoSection(),
        // SliverToBoxAdapter(
        //   child: Container(
        //     height: 300.0,
        //     color: Colors.green,
        //   ),
        // ),
        //TODO:Add menu item grid view section
        // SliverFillRemaining(
        //   child: Container(
        //     color: Colors.blue,
        //   ),
        // )
        _buildGridViewSection('Menu'),
      ],
    );
  }

  //TODO:Build silver app bar
  SliverAppBar _buildSilverAppBar() {
    return SliverAppBar(
      //creates a collapsible app bar,
      pinned: true, //keep the appbaf pinned at the top view
      expandedHeight:
          300.0, //specifies expanded height for max height when fully expanded
      flexibleSpace: FlexibleSpaceBar(
        //flexible splacebar for the collapsible part of the sapp bar
        background: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 64.0),
            child: Stack(
              children: [
                Container(
                  //backdrop
                  margin: const EdgeInsets.only(bottom: 30.0),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                          //uses as a backgroud image
                          image: AssetImage(widget.restaurant.image),
                          fit: BoxFit.cover)),
                ),
                const Positioned(
                  bottom: 0.0,
                  left: 16.0,
                  child: CircleAvatar(
                    radius: 30,
                    child: Icon(Icons.store, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //TODO:Build info section
  SliverToBoxAdapter _buildInfoSection() {
    final textTheme = Theme.of(context).textTheme;
    final restaurant = widget.restaurant;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: textTheme.headlineLarge,
            ),
            Text(
              restaurant.address,
              style: textTheme.bodySmall,
            ),
            Text(
              restaurant.getRatingAndDistance(),
              style: textTheme.bodySmall,
            ),
            Text(
              restaurant.attributes,
              style: textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }

  //TODO:Build grid item
  Widget _buildGridItem(int index) {
    //the index is used to access a specific item from the restaurant menu
    final item = widget.restaurant.items[index];
    return InkWell(
      //this helps to lay the groundwork for interactive functionality,such as opening a detai view in a ottom sheet upon tapping
      onTap: () {
        //present bottom sheet in the future
      },
      child: RestaurantItem(item: item),
    );
  }

  //TODO:Build section title -simply creates a text with some padding
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  //TODO:Build grid view
  GridView _buildGridView(int columns) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3.5,
          crossAxisCount: columns
          ),
      itemBuilder: (context, index) => _buildGridItem(index),
      itemCount: widget.restaurant.items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  //TODO:Build grid view section
  SliverToBoxAdapter _buildGridViewSection(String title) {
    final columns = calculateColumnCount(MediaQuery.of(context)
        .size
        .width); //calculate the no of columns based on the screen width
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //sets up a vertical layout with a column widget
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(title),
            _buildGridView(
                columns), //add a gridview with specified no of columns
          ],
        ),
      ),
    );
  }

  //TODO:Replace with build method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //TODO:Replace with custom scroll view
        child: _buildCustomScrollView(),
      ),
    );
  }
}
