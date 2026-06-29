import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String id;
  final String userId;
  final String userName;
  final String userPhotoUrl;
  final String content;
  final String imageUrl;
  final List<String> likes;
  final List<Map<String, dynamic>> comments;
  final int shares;
  final Timestamp? timestamp;

  PostModel({
    required this.id,
    required this.userId,
    required this.userName,
    this.userPhotoUrl = '',
    required this.content,
    this.imageUrl = '',
    this.likes = const [],
    this.comments = const [],
    this.shares = 0,
    this.timestamp,
  });

  factory PostModel.fromMap(String id, Map<String, dynamic> map) {
    return PostModel(
      id: id,
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userPhotoUrl: map['userPhotoUrl'] ?? '',
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      likes: List<String>.from(map['likes'] ?? []),
      comments: List<Map<String, dynamic>>.from(map['comments'] ?? []),
      shares: map['shares'] ?? 0,
      timestamp: map['timestamp'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userPhotoUrl': userPhotoUrl,
      'content': content,
      'imageUrl': imageUrl,
      'likes': likes,
      'comments': comments,
      'shares': shares,
      'timestamp': timestamp ?? FieldValue.serverTimestamp(),
    };
  }
}
