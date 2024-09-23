import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({
    super.key,
    required this.post,
  });
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.apply(
          displayColor: Theme.of(context).colorScheme.onSurface,
        );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(post.profileImageUrl),
            ), //used to display a profile image or user's avatar in a circular shape
            const SizedBox(
              width: 16.0,
            ),

            Expanded(
// 2
              child: Column(
                mainAxisSize: MainAxisSize.min,//alligns them to occupy the min space
                crossAxisAlignment: CrossAxisAlignment.start,//aligns the widget to the left sode
                children: [
// 3
                  Text(post.comment,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium),
                  Text(
                    '${post.timestamp} mins ago',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
