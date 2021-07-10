import 'package:best_architecture_challenge/model/PostSortingType.dart';
import 'package:best_architecture_challenge/repository/PostRepository.dart';
import 'package:bloc/bloc.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final IPostRepository postRepository;

  PostCubit({required this.postRepository}) : super(PostInitial());

  Future fetchData(PostSortingType sortingType) async {
    final posts = await postRepository.getPostsAsync();
    if (sortingType == PostSortingType.id) {
      posts.sort((a, b) {
        return a.id.compareTo(b.id);
      });
    } else if (sortingType == PostSortingType.title) {
      posts.sort((a, b) {
        return a.title.compareTo(b.title);
      });
    }
    emit(PostFetchSuccess(posts: posts));
  }
  
}
