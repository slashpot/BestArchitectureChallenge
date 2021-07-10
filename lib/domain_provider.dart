import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post/cubit/post_cubit.dart';

class DomainProvider extends StatelessWidget {
  final Widget child;
  const DomainProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PostCubit>(
        create: (BuildContext context) => PostCubit(),
      ),
    ], child: child);
  }
}
