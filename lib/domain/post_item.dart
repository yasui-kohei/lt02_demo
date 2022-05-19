
class PostItem {
  final String postId;
  final String postUser;
  final String caption;
  final DateTime postDateTime;

//<editor-fold desc="Data Methods">

  const PostItem({
    required this.postId,
    required this.postUser,
    required this.caption,
    required this.postDateTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostItem &&
          runtimeType == other.runtimeType &&
          postId == other.postId &&
          postUser == other.postUser &&
          caption == other.caption &&
          postDateTime == other.postDateTime);

  @override
  int get hashCode =>
      postId.hashCode ^
      postUser.hashCode ^
      caption.hashCode ^
      postDateTime.hashCode;

  @override
  String toString() {
    return 'PostItem{' +
        ' postId: $postId,' +
        ' postUser: $postUser,' +
        ' caption: $caption,' +
        ' postDateTime: $postDateTime,' +
        '}';
  }

  PostItem copyWith({
    String? postId,
    String? postUser,
    String? caption,
    DateTime? postDateTime,
  }) {
    return PostItem(
      postId: postId ?? this.postId,
      postUser: postUser ?? this.postUser,
      caption: caption ?? this.caption,
      postDateTime: postDateTime ?? this.postDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': this.postId,
      'postUser': this.postUser,
      'caption': this.caption,
      'postDateTime': this.postDateTime.toIso8601String(),
    };
  }

  factory PostItem.fromMap(Map<String, dynamic> map) {
    return PostItem(
      postId: map['postId'] as String,
      postUser: map['postUser'] as String,
      caption: map['caption'] as String,
      postDateTime: DateTime.parse(map['postDateTime'] as String),
    );
  }

//</editor-fold>
}