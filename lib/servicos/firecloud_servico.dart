import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServico {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> adicionarDocId(String id) async {
    try {
      // Assume que você quer criar um documento com o ID fornecido
      await _firestore.collection("users").doc(id).set({'id': id}); // Por exemplo
      print("Documento adicionado com sucesso"); // Usando print para depuração, substitua por um framework de logging em produção
    } catch (e) {
      print("Falha ao adicionar documento: $e"); // Usando print para depuração, substitua por um framework de logging em produção
    }
  }
}
