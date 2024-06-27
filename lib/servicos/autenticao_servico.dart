import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AutenticaoServico {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseReference _usersRef = FirebaseDatabase.instance.reference().child('users');

  Future<String?> cadastrarUsuario({
    required String email,
    required String senha,
    String? cnpj,
    String? cpf,
    required String nome,
    required String celular,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      String userId = userCredential.user!.uid;

      await _usersRef.child(userId).set({
        'email': email,
        'cpf': cpf ?? '',
        'cnpj': cnpj ?? '',
        'nome': nome,
        'celular': celular,
        'type': 'gerencia',
        'idFazenda': '',
      });

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "O usuário já está cadastrado";
      }
      return "Erro desconhecido";
    }
  }

  Future<String?> logarUsuarios({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
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
