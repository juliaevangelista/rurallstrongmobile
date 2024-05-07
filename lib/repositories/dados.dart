import 'package:firebase_database/firebase_database.dart';

class DadosBD {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref();

  DatabaseReference getReferencia(String caminho) {
    return _databaseReference.child(caminho);
  }

  Future<DatabaseEvent> lerDadosUmaVez(String caminho) async {
    DatabaseReference referencia = getReferencia(caminho);
    try {
      DatabaseEvent snapshot = await referencia.once();
      return snapshot;
    } catch (erro) {
      print('Erro ao ler os dados: $erro');
      throw erro;
    }
  }

  Stream<DataSnapshot> aoMudarDados(String caminho) {
    DatabaseReference referencia = getReferencia(caminho);
    return referencia.onValue.map((evento) => evento.snapshot);
  }

  Query consultarDados(String caminho) {
    DatabaseReference referencia = getReferencia(caminho);
    return referencia.orderByChild('idade').limitToFirst(10);
  }

  Future<void> definirDados(String caminho, Map<String, dynamic> dados) async {
    DatabaseReference referencia = getReferencia(caminho);
    try {
      await referencia.set(dados);
    } catch (erro) {
      print('Erro ao definir os dados: $erro');
      throw erro;
    }
  }

  Future<void> atualizarDados(String caminho, Map<String, dynamic> dados) async {
    DatabaseReference referencia = getReferencia(caminho);
    try {
      await referencia.update(dados);
    } catch (erro) {
      print('Erro ao atualizar os dados: $erro');
      throw erro;
    }
  }

  Future<void> removerDados(String caminho) async {
    DatabaseReference referencia = getReferencia(caminho);
    try {
      await referencia.remove();
    } catch (erro) {
      print('Erro ao remover os dados: $erro');
      throw erro;
    }
  }

  Future<TransactionResult> executarTransacao(String caminho, TransactionHandler manipuladorTransacao,
      {bool aplicarLocalmente = true}) async {
    DatabaseReference referencia = getReferencia(caminho);
    try {
      return await referencia.runTransaction(manipuladorTransacao, applyLocally: aplicarLocalmente);
    } catch (erro) {
      print('Erro ao executar a transação: $erro');
      throw erro;
    }
  }

  void usarEmuladorBancoDados(String host, int porta) {
    FirebaseDatabase.instance.useDatabaseEmulator(host, porta);
  }
}
