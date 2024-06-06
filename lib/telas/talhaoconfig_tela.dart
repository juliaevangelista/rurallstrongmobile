import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/telateste.dart';

class TalhaoConfigTela extends StatefulWidget {
  const TalhaoConfigTela({Key? key}) : super(key: key);

  @override
  State<TalhaoConfigTela> createState() => _TalhaoConfigTelaState();
}

class _TalhaoConfigTelaState extends State<TalhaoConfigTela> {
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
                    'assets/icon-talhoes.png',
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
                      'TALHÃO',
                      style: TextStyle(fontSize: 19),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            height: 200,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('icon'),
                    Text('NOME'),
                    Text('TALHAO8'),
                    Text('TAMANHO HECTARES'),
                    Text('125,5'),
                    Text('FAZENDA'),
                    Text('FAZENDA PRIMAVERA'),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text('EDITAR')),
                    ElevatedButton(onPressed: () {}, child: Text('EXCLUIR')),
                    Text('COD'),
                    Text('0002')
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text(
                'PRODUÇÃO',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          )),
          Container(
            width: 350,
            height: 250,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('icon'),
                    Text('NOME'),
                    Text('TALHAO8'),
                    Text('TAMANHO HECTARES'),
                    Text('125,5'),
                    Text('FAZENDA'),
                    Text('FAZENDA PRIMAVERA'),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('EDITAR'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, // Cor de fundo do botão
                        backgroundColor: Color.fromRGBO(61, 190, 1,
                            1), // Cor do texto do botão quando pressionado
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Borda arredondada do botão
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('icon'),
                    Text('NOME'),
                    Text('TALHAO8'),
                    Text('TAMANHO HECTARES'),
                    Text('125,5'),
                    Text('FAZENDA'),
                    Text('FAZENDA PRIMAVERA'),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('EXCLUIR'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, // Cor de fundo do botão
                        backgroundColor: Colors.red, // Cor do texto do botão quando pressionado
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Borda arredondada do botão
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('NOVA PRODUÇÃO'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, // Cor de fundo do botão
              backgroundColor: Color.fromRGBO(
                  61, 190, 1, 1), // Cor do texto do botão quando pressionado
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Borda arredondada do botão
              ),
            ),
          ),
        ],
      ),
    );
  }
}
