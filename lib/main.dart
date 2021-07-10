import 'package:flutter/material.dart';

import 'domain_provider.dart';
import 'post/post_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyApp',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: DomainProvider(child: PostPage(title: 'FlutterTaipei :')));
  }
}
