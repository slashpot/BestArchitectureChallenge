import 'package:best_architecture_challenge/repository/PostRepository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post/cubit/post_cubit.dart';

class DomainProvider extends StatefulWidget {
  final Widget child;

  const DomainProvider({Key? key, required this.child}) : super(key: key);

  @override
  _DomainProviderState createState() => _DomainProviderState();
}

class _DomainProviderState extends State<DomainProvider> {
  final IPostRepository postRepository = PostRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PostCubit>(
        create: (BuildContext context) => PostCubit(postRepository: postRepository),
      ),
    ], child: widget.child);
  }
}
