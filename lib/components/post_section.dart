import 'package:flutter/material.dart';
import 'package:restaurant/components/post_card.dart';
import 'package:restaurant/models/post.dart';

class PostSection extends StatelessWidget {
  final List<Post> posts;
  const PostSection({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text('Friend\'s Activity',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          ListView.separated(
            primary: false,//this isnt the primary list view
            shrinkWrap: true,//to avoid unbounded height error
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),//disabling its scrolling
            itemCount:posts.length,
            itemBuilder: (context,index){
              return PostCard(post: posts[index]);
            }, separatorBuilder: (context,index){
              return const SizedBox(height: 16);
            }, )
        ],
        
      ),
    );
  }
}
