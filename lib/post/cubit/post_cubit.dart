import 'package:bloc/bloc.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  void fetchData() {
    
  }
  
}
