
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lt02_demo/domain/post_item.dart';
import 'package:lt02_demo/domain/user.dart';
import 'package:uuid/uuid.dart';

class PostRepository {
  PostRepository._();
  static final instance = PostRepository._();
  final _db = FirebaseFirestore.instance;

  /// 投稿するメソッド
  Future<void> post(String postUser, String caption) async {
    PostItem convertPostItem = convertToPostItem(postUser, caption);
    await _db.collection('posts').doc(convertPostItem.postId).set(convertPostItem.toMap());
  }

   Future<Stream<QuerySnapshot<dynamic>>> fetchPostItems () async{
    return await _db.collection('posts').orderBy('postDateTime').snapshots();
   }

  PostItem convertToPostItem(String postUser, String caption) {
    return PostItem(
        postId: Uuid().v1(),
        postUser: postUser,
        caption: caption,
        postDateTime: DateTime.now());
  }


}