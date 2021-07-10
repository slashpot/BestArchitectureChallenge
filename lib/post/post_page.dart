import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/post_cubit.dart';
import 'cubit/post_state.dart';


class PostPage extends StatefulWidget {
  PostPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostCubit>(context).fetchData(PostSortingType.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text('使用id排序'),
                        value: PostSortingType.id,
                      ),
                      PopupMenuItem(
                        child: Text('使用title排序'),
                        value: PostSortingType.title,
                      )
                    ],
                onSelected: (PostSortingType selectedType) {
                  BlocProvider.of<PostCubit>(context).fetchData(selectedType);
                })
          ],
        ),
        body: BlocBuilder<PostCubit, PostState>(builder: (context, state) {
          if (state is PostFetchSuccess) {
            return ListView.separated(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                String id = state.posts[index].id.toString();
                String title = state.posts[index].title.toString();
                String body = state.posts[index].body.toString();
                return Container(
                    padding: EdgeInsets.all(8),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: "$id. $title",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          TextSpan(
                            text: '\n' + body,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ));
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            );
          } else {
            return Container();
          }
        }));
  }
}
