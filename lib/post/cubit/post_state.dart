import 'package:best_architecture_challenge/model/Post.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostFetchSuccess extends PostState with EquatableMixin {
  final List<Post> posts;

  PostFetchSuccess({required this.posts});

  @override
  List<Object?> get props => [posts];
}
