import 'package:flutter/material.dart';
import 'package:yummy/components/components.dart';
import 'package:yummy/models/models.dart';

class PostSection extends StatelessWidget {
  final List<Post> posts;

  const PostSection({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              "Friend's Activity",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 110,
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SizedBox(
                width: 300.0,
                child:PostCard(post: posts[index]),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: posts.length,
            ),
          )
        ],
      )
    );
  }
}