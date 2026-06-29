import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createPost({
    required String userId,
    required String userName,
    required String userPhotoUrl,
    required String content,
    String? imageUrl,
  }) async {
    await _firestore.collection('posts').add({
      'userId': userId,
      'userName': userName,
      'userPhotoUrl': userPhotoUrl,
      'content': content,
      'imageUrl': imageUrl ?? '',
      'likes': [],
      'comments': [],
      'shares': 0,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot> getPosts() {
    return _firestore
        .collection('posts')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> toggleLike(String postId, String userId) async {
    DocumentReference postRef = _firestore.collection('posts').doc(postId);
    
    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot post = await transaction.get(postRef);
      List likes = List.from(post['likes'] ?? []);
      
      if (likes.contains(userId)) {
        likes.remove(userId);
      } else {
        likes.add(userId);
      }
      
      transaction.update(postRef, {'likes': likes});
    });
  }

  Future<void> addComment(String postId, String userId, String userName, String comment) async {
    await _firestore.collection('posts').doc(postId).update({
      'comments': FieldValue.arrayUnion([{
        'userId': userId,
        'userName': userName,
        'comment': comment,
        'timestamp': Timestamp.now(),
      }])
    });
  }

  Future<void> sharePost(String postId) async {
    await _firestore.collection('posts').doc(postId).update({
      'shares': FieldValue.increment(1),
    });
  }

  Future<DocumentSnapshot> getUserData(String userId) async {
    return await _firestore.collection('users').doc(userId).get();
  }

  Future<void> updateUserProfile(String userId, {String? name, String? bio, String? photoUrl}) async {
    Map<String, dynamic> data = {};
    if (name != null) data['name'] = name;
    if (bio != null) data['bio'] = bio;
    if (photoUrl != null) data['photoUrl'] = photoUrl;
    
    await _firestore.collection('users').doc(userId).update(data);
  }
}
