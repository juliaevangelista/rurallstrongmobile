import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServico {
  final db = FirebaseFirestore.instance;
  
  Future<void> adicionarDocId(String id) async {
    try {
      // Assuming you want to create a document with the provided ID
      await db.collection("users").doc(id).set({'id': id}); // For example
      print("Document added successfully"); // Using print for debugging, replace with logging framework in production
    } catch (e) {
      print("Failed to add document: $e"); // Using print for debugging, replace with logging framework in production
    }
  }
}
