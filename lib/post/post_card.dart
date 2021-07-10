import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final int? id;
  final String? title;
  final String? body;

  const PostCard({Key? key, this.id, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String presentId = id == null ? '' : id.toString();
    String presentTitle = title == null ? '' : title as String;
    String presentBody = body == null ? '' : body as String;
    
    return Container(
        padding: EdgeInsets.all(8),
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: "$presentId. $presentTitle",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              TextSpan(
                text: '\n' + presentBody,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
