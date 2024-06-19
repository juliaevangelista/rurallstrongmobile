import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rurallstrong/telas/telateste.dart';

class ColaboradorListaTela extends StatefulWidget {
  const ColaboradorListaTela({Key? key}) : super(key: key);

  @override
  State<ColaboradorListaTela> createState() => _ColaboradorListaTelaState();
}

class _ColaboradorListaTelaState extends State<ColaboradorListaTela> {
  final DatabaseReference _colaboradorRef = FirebaseDatabase.instance.ref().child('Funcionarios');

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
                        'COLABORADOR',
                        style: TextStyle(fontSize: 19),
                      )),
                ],
              ),
            ),
            StreamBuilder<DatabaseEvent>(
              stream: _colaboradorRef.onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  DataSnapshot data = snapshot.data!.snapshot;
                  Map<dynamic, dynamic>? colaboradorData = data.value as Map<dynamic, dynamic>?;
                  if (colaboradorData != null) {
                    List<Widget> colaboradorContainers = [];
                    for (var colaborador in colaboradorData.entries) {
                      colaboradorContainers.add(
                        colaboradorContainer(
                          context,
                          colaborador.value['nome'],
                          colaborador.value['codigo'],
                          colaborador.value['cpf'],
                          colaborador.value['email'],
                          colaborador.value['setor'],
                          colaborador.value['rg'],
                          colaborador.value['password'],
                          colaborador.value['endereco'],
                        ),
                      );
                    }
                    return GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: colaboradorContainers,
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

  Widget colaboradorContainer(
    BuildContext context,
    dynamic nome,
    dynamic codigo,
    dynamic cpf,
    dynamic email,
    dynamic setor,
    dynamic rg,
    dynamic password,
    dynamic endereco,
  ) {
    // Verificar nome
    String nomeValue = nome != null ? nome.toString() : 'N/A';

    // Verificar codigo
    String codigoValue = codigo != null ? codigo.toString() : 'N/A';

    // Verificar cpf
    String cpfValue = cpf != null ? cpf.toString() : 'N/A';

    // Verificar email
    String emailValue = email != null ? email.toString() : 'N/A';

    // Verificar setor
    String setorValue = setor != null ? setor.toString() : 'N/A';

    // Verificar rg
    String rgValue = rg != null ? rg.toString() : 'N/A';

    // Verificar password
    String passwordValue = password != null ? password.toString() : 'N/A';

    // Verificar endereco
    String enderecoValue = endereco != null ? endereco.toString() : 'N/A';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
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
                  Text(
                    'NOME',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    nomeValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'TAMANHO HECTARES',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    codigoValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'CPF',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    cpfValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'EMAIL',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    emailValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                ],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SETOR',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    setorValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'RG',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    rgValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'PASSWORD',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    passwordValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'ENDEREÇO',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    enderecoValue,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
