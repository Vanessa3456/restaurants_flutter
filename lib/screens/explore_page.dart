import 'package:flutter/material.dart';
import '../api/mock_yummy_service.dart';
import '../components/restaurant_section.dart';
import '../components/category_section.dart';
import '../components/post_section.dart';
import '../models/cart_manager.dart';
import '../models/order_manager.dart';

class ExplorePage extends StatefulWidget {
  final CartManager cartManager;
  final OrderManager orderManager;

  ExplorePage({
    super.key,
    required this.cartManager, 
    required this.orderManager});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final mockService = MockYummyService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final restaurants = snapshot.data?.restaurants ?? [];
          final categories = snapshot.data?.categories ?? [];
          final posts = snapshot.data?.friendPosts ?? [];
          return ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                RestaurantSection(
                  restaurants: restaurants,
                  cartManager: widget.cartManager,
                  orderManager: widget.orderManager,),
                CategorySection(categories: categories),
                PostSection(posts: posts),
              ]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}