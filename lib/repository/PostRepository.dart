import 'dart:convert';

import "../model/Post.dart";
import 'package:http/http.dart' as http;


abstract class IPostRepository {
 Future<Iterable<Post>> getPosts();
}

class PostRepository implements IPostRepository {
  @override
  Future<Iterable<Post>>  getPosts() async {
    var url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    var response = await http.get(url);
    List<dynamic> result = jsonDecode(response.body);
    return result.map((e) => Post.fromJson(e));
  }
}