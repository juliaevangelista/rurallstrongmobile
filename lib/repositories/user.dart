/* import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

Future<Map<String, dynamic>?> getUserData(String userId) async {
  DatabaseReference userRef = FirebaseDatabase.instance.ref().child('users').child(userId);

  try {
    DataSnapshot snapshot = await userRef.once();

    if (snapshot.value != null) {
      return Map<String, dynamic>.from(snapshot.value);
    }

    return null;
  } catch (error) {
    print('Erro ao obter dados do usuário do Firebase: $error');
    throw error;
  }
}
 */