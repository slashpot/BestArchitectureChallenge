import 'package:best_architecture_challenge/post/post_card.dart';
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
                return PostCard(
                  id: state.posts[index].id,
                  title: state.posts[index].title,
                  body: state.posts[index].body,
                );
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
