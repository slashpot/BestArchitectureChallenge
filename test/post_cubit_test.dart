import 'package:best_architecture_challenge/model/Post.dart';
import 'package:best_architecture_challenge/post/cubit/post_cubit.dart';
import 'package:best_architecture_challenge/post/cubit/post_state.dart';
import 'package:best_architecture_challenge/repository/PostRepository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostCubit', () {
    blocTest<PostCubit, PostState>(
      'should fetch post data and sort by id when calling fetchData method with id as PostSortingType',
      build: () {
        final mockData = [
          Post(userId: 1, title: 'abcd', id: 4, body: 'body a'),
          Post(userId: 2, title: 'uifasd', id: 3, body: 'body b'),
        ];
        return PostCubit(postRepository: MockPostRepository(mockData: mockData));
      },
      act: (cubit) => cubit.fetchData(PostSortingType.id),
      expect: () => [
        PostFetchSuccess(posts: [
          Post(userId: 2, title: 'uifasd', id: 3, body: 'body b'),
          Post(userId: 1, title: 'abcd', id: 4, body: 'body a'),
        ])
      ],
    );

    blocTest<PostCubit, PostState>(
      'should fetch post data and sort by title when calling fetchData method with title as PostSortingType',
      build: () {
        final mockData = [
          Post(userId: 1, title: 'abcd', id: 4, body: 'body a'),
          Post(userId: 2, title: 'uifasd', id: 3, body: 'body b'),
        ];
        return PostCubit(postRepository: MockPostRepository(mockData: mockData));
      },
      act: (cubit) => cubit.fetchData(PostSortingType.title),
      expect: () => [
        PostFetchSuccess(posts: [
          Post(userId: 1, title: 'abcd', id: 4, body: 'body a'),
          Post(userId: 2, title: 'uifasd', id: 3, body: 'body b'),
        ])
      ],
    );
  });
}


class MockPostRepository extends IPostRepository {
  final List<Post> mockData;

  MockPostRepository({required this.mockData});

  @override
  Future<List<Post>> getPostsAsync() async{
    return mockData;
  }
}
