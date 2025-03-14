import 'package:flutter/material.dart';
import '../models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
      .textTheme
      .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TODO: add CircleAvatar
            // TODO: add spacing
            // TODO: add Expanded Widget
          ],
        ),
      ),
    );
  }
}