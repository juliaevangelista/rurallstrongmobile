import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/inicio_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class DadosTela extends StatefulWidget {
  const DadosTela({Key? key}) : super(key: key);

  @override
  State<DadosTela> createState() => _DadosTelaState();
}

class _DadosTelaState extends State<DadosTela> {
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
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InicioTela()),
                      );
                    },
                    child: Container(
                      width: 65,
                      height: 65,
                      margin: EdgeInsets.fromLTRB(20, 15, 20, 7),
                      child: Image.asset(
                        'assets/APLICATIVO-17.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                SizedBox(
                  width: 120,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color.fromRGBO(
                          61, 190, 1, 1),
                      backgroundColor: Color.fromRGBO(61, 190, 1,
                          0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaTeste()),
                      );
                    },
                    child: Text(
                      'ATUALIZAR',
                      style:
                          TextStyle(fontSize: 21),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            height: 250,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey, 
                  spreadRadius: 2,
                  blurRadius: 5, 
                  offset: Offset(
                      0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                buildButtons(context),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '100%',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'SINCRONIZADO...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black, // Cor de fundo do botão
                backgroundColor: Color.fromRGBO(
                    61, 190, 1, 1), // Cor do texto do botão quando pressionado
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Borda arredondada do botão
                ),
              ),
              child: Text(
                "INICIAR",
                style: TextStyle(
                  fontSize: 22.0, // Tamanho da fonte do texto
                ),
              ),
            ),
          ),
          SizedBox(height: 100,),
          BotaoFazenda(),
        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCustomButtons(
            'assets/icon-dados.png',
            'DADOS',
            () {
              // Navegar para a página de Dados
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaTeste()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomButtons(
      String imagePath, String text, VoidCallback onPressed) {
    return Container(
      width: 320,
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 190, 1, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 55.0,
              height: 55.0,
            ),
            SizedBox(width: 8.0),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget BotaoFazenda() {
    return Container(
      width: 200,
      height: 55,
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 190, 1, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () => {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 5.0),
            Image.asset(
              'assets/Ico APP Rurall-13.png',
              width: 55.0,
              height: 55.0,
            ),
            SizedBox(width: 25.0),
            Text(
              'FAZENDA',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
