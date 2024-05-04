import 'package:firebase_auth/firebase_auth.dart';
//import 'package:rural_strong/servicos/firecloud_servico.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rurallstrong/servicos/firecloud_servico.dart';


class AutenticaoServico extends FirestoreServico {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario({
    required String email,
    required String senha,
    required String cnpj,
    required String cpf,
    required String nome,
    required String celular,
  }) async {
    try {
      UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
    
      String userId = userCredential.user!.uid;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference users = firestore.collection('users');

    await users.doc(userId).set({
      'email': email,
      'cpf': cpf,
      'cnpj': cnpj,
      'nome': nome,
      'celular': celular,
    });

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "O usuário já está cadastrado";
      }
      return "Erro desconhecido";
    }
  }

  Future<String?> logarUsuarios(
      {required String email, required String senha}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> deslogar() {
    return _firebaseAuth.signOut();
  }

  Future<String?> obterId() async {
    String? id;
    try {
      await _firebaseAuth.authStateChanges().listen((User? user) {
        if (user != null) {
          id = user.uid;
        }
      });
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
    return id;
  }
}
