import 'package:cloud_firestore/cloud_firestore.dart';
class FirebaseRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getFirestoreData(String users) async {
    List<Map<String, dynamic>> data = [];

    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection(users).get();

      snapshot.docs.forEach((doc) {
        data.add(doc.data());
      });
    } catch (e) {
      print("Error fetching Firestore data: $e");
    }

    return data;
  }

  // Outros métodos para adicionar, atualizar ou excluir dados conforme necessário
}
