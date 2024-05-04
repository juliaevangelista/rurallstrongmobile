import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/cadastrarproducao_tela.dart';
import 'package:rurallstrong/telas/producaoativas_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class ProducaoTela extends StatefulWidget {
  const ProducaoTela({Key? key}) : super(key: key);

  @override
  State<ProducaoTela> createState() => _ProducaoTelaState();
}

class _ProducaoTelaState extends State<ProducaoTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            //padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                    'assets/icon-doencas-verde.png',
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
                      'PRODUÇÃO',
                      style: TextStyle(fontSize: 19),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [BotaoAtivas(context), BotaoCadastrarNova(context)],
          ),
        ],
      ),
    );
  }

  Widget BotaoAtivas(context) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.only(top: 70),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProducaoAtivasTela()),
              );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, // Cor de fundo do botão
          backgroundColor: Color.fromRGBO(
              61, 190, 1, 1), // Cor do texto do botão quando pressionado
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(7.0), // Borda arredondada do botão
          ),
        ),
        child: Text(
          "ATIVAS",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget BotaoCadastrarNova(context) {
    return Container(
      width: 250,
      height: 50,
      margin: EdgeInsets.only(top: 50),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CadastrarProducaoTela()),
              );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, // Cor de fundo do botão
          backgroundColor: Colors.black, // Cor do texto do botão quando pressionado
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(7.0), // Borda arredondada do botão
          ),
        ),
        child: Text(
          "CADASTRAR NOVA",
          style: TextStyle(
            color: Color.fromRGBO(61, 190, 1, 1),
            fontSize: 22.0, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}