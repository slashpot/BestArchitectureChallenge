import 'dart:convert';

import "../model/Post.dart";
import 'package:http/http.dart' as http;

abstract class IPostRepository {
 Future<List<Post>> getPostsAsync();
}

class PostRepository implements IPostRepository {
  @override
  Future<List<Post>>  getPostsAsync() async {
    final url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    final response = await http.get(url);
    final List<dynamic> result = jsonDecode(response.body);
    return result.map((e) => Post.fromJson(e)).toList();
  }
}