import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/telateste.dart';

class FornecedorListaTela extends StatefulWidget {
  const FornecedorListaTela({Key? key}) : super(key: key);

  @override
  State<FornecedorListaTela> createState() => _FornecedorListaTelaState();
}

class _FornecedorListaTelaState extends State<FornecedorListaTela> {
  final DatabaseReference _fornecedorRef = FirebaseDatabase.instance.ref().child('Fornecedores');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              height: 120,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/APLICATIVO-17.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                    child: Image.asset(
                      'assets/icon-app.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromRGBO(61, 190, 1, 1),
                      backgroundColor: Color.fromRGBO(61, 190, 1, 0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaTeste()),
                      );
                    },
                    child: Text(
                      'FORNECEDOR',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
            StreamBuilder<DatabaseEvent>(
              stream: _fornecedorRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DataSnapshot data = snapshot.data!.snapshot;
                  Map<dynamic, dynamic>? fornecedorData = data.value as Map<dynamic, dynamic>?;
                  if (fornecedorData != null) {
                    List<Widget> fornecedorContainers = [];
                    for (var fornecedor in fornecedorData.entries) {
                      fornecedorContainers.add(
                        fornecedorContainer(
                          context,
                          fornecedor.value['nome'],
                          fornecedor.value['razaoSocial'],
                          fornecedor.value['idFazenda'],
                          fornecedor.value['endereco'],
                          fornecedor.value['cep'],
                          fornecedor.value['email'],
                          fornecedor.value['cnpj'],
                          fornecedor.value['telefone'],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: fornecedorContainers,
                    );
                  } else {
                    return Text('No data available');
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget fornecedorContainer(
    BuildContext context,
    dynamic nome,
    dynamic razaoSocial,
    dynamic idFazenda,
    dynamic endereco,
    dynamic cep,
    dynamic email,
    dynamic cnpj,
    dynamic telefone,
  ) {
    // Verificar e converter para String ou 'N/A' se nulo
    String nomeValue = nome != null ? nome.toString() : 'N/A';
    String razaoSocialValue = razaoSocial != null ? razaoSocial.toString() : 'N/A';
    String idFazendaValue = idFazenda != null ? idFazenda.toString() : 'N/A';
    String enderecoValue = endereco != null ? endereco.toString() : 'N/A';
    String cepValue = cep != null ? cep.toString() : 'N/A';
    String emailValue = email != null ? email.toString() : 'N/A';
    String cnpjValue = cnpj != null ? cnpj.toString() : 'N/A';
    String telefoneValue = telefone != null ? telefone.toString() : 'N/A';

    return Container(
      width: 150,
      height: 220,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/icon-talhoes.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'NOME',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              nomeValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'RAZÃO SOCIAL',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              razaoSocialValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'FAZENDA',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              idFazendaValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'ENDEREÇO',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              enderecoValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'CEP',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              cepValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'EMAIL',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              emailValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'CNPJ',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              cnpjValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
            SizedBox(height: 2),
            Text(
              'TELEFONE',
              style: TextStyle(fontSize: 8),
            ),
            Text(
              telefoneValue,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
