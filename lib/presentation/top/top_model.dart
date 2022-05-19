

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lt02_demo/repositories/post_repository.dart';
import 'package:lt02_demo/repositories/user_repository.dart';

final postsQueryProvider = StreamProvider.autoDispose((ref) {
  return FirebaseFirestore.instance
      .collection('posts')
      .orderBy('postDateTime')
      .snapshots();
});

final topProvider = ChangeNotifierProvider((ref) => TopModel._());

class TopModel extends ChangeNotifier{

  TopModel._();
  final postRepository = PostRepository.instance;
  final userRepository = UserRepository.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// 投稿内容のEditingController
  final captionController = TextEditingController();

  /// ユーザー情報
  //final currentUser = UserRepository.currentUser;

  /// 投稿するメソッド
  Future<void> post() async{
    final currentUser = await userRepository.fetchCurrentUser(_auth.currentUser!.uid);
    await postRepository.post(currentUser.name, captionController.text);
    captionController.clear();
  }

  /// 投稿一覧のスナップショット取得メソッド
  Future<Stream> fetchPostItems() async {
    return await postRepository.fetchPostItems();
  }


}