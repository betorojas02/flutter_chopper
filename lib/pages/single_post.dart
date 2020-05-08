import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:chopperapp/data/post_api_version.dart';
import 'package:flutter/material.dart';
import 'package:chopperapp/pages/single_post.dart';
class SinglePostPage extends StatelessWidget {
  final int postId;

  const SinglePostPage ({ Key key, this.postId})  : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostApiService api = PostApiService.create();
    return Scaffold(
      appBar: AppBar(
        title: Text('Chopper Blog'),
      ),
      body: FutureBuilder<Response>(
        future: api.getPost(postId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final Map post = json.decode(snapshot.data.bodyString);
            return _buildPost(post);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
  Padding _buildPost(Map post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            post['title'],
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(post['body']),
        ],
      ),
    );
  }
}
