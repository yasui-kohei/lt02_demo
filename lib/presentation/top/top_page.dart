
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lt02_demo/presentation/top/top_model.dart';

/// みんなが投稿したメッセージ一覧が表示されるページ
class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topState = ref.watch(topProvider);
    final AsyncValue<QuerySnapshot> asyncPostsQuery = ref.watch(postsQueryProvider);
    /// 投稿用のダイアログ
    Future<void> PostDialog(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('何かをコメントしてみる'),
              content: TextField(
                controller: topState.captionController,
                decoration: InputDecoration(hintText: "ここに入力"),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('キャンセル'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text('OK'),
                  onPressed: () async {
                    await topState.post();
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      body: Column(
        children: [
          Center(child: Text('LT会へようこそ！！',style: TextStyle(
            fontSize: 30,
          ),)),
          SizedBox(height: 20,),
          Expanded(child: asyncPostsQuery.when(
              data: (QuerySnapshot query){
                return ListView(
                  children: query.docs.map((document) {
                      return Card(
                        child: ListTile(
                          title: Text(document['caption']),
                          subtitle:Text(document['postUser']),
                        ),
                      );
                    }).toList(),
                );
              },
              error: (e, st) {
                return Center(
                  child: Text(e.toString()),
                );
              },
              loading: () {
                return Center(
                  child: Text('読み込み中...'),
                );
              }
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () async {
          PostDialog(context);
        },
      ),
    );

  }
}
