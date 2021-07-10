import 'package:best_architecture_challenge/model/Post.dart';
import 'package:best_architecture_challenge/repository/PostRepository.dart';
import 'package:bloc/bloc.dart';
import 'post_state.dart';

enum PostSortingType {
  id,
  title
}

class PostCubit extends Cubit<PostState> {
  final IPostRepository postRepository;
  final Map<PostSortingType,int Function(Post,Post)> sortingMap = {
    PostSortingType.id: sortById,
    PostSortingType.title: sortByTitle
  };

  PostCubit({required this.postRepository}) : super(PostInitial());

  Future fetchData(PostSortingType sortingType) async {
    final posts = await postRepository.getPostsAsync();
    posts.sort(sortingMap[sortingType]);
    emit(PostFetchSuccess(posts: posts));
  }
}

int sortById(Post a, Post b) {
  return a.id.compareTo(b.id);
}

int sortByTitle(Post a, Post b) {
  return a.title.compareTo(b.title);
}
