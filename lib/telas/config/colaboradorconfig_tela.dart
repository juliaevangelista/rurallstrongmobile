import 'package:flutter/material.dart';
import 'package:rurallstrong/telas/config/lista/colaboradorlista_tela.dart';
import 'package:rurallstrong/telas/inicio_tela.dart';
import 'package:rurallstrong/telas/telateste.dart';

class ColaboradorConfigTela extends StatefulWidget {
  const ColaboradorConfigTela({Key? key}) : super(key: key);

  @override
  State<ColaboradorConfigTela> createState() => _ColaboradorConfigTelaState();
}

class _ColaboradorConfigTelaState extends State<ColaboradorConfigTela> {
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
                  width: 10,
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
                  width: 0,
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
                      style: TextStyle(fontSize: 16),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ColaboradorListaTela()),
              )
            },
            child:
          Container(
            width: 300,
            height: 220,
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        'assets/icon-talhoes.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text('NOME', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('TALHAO8',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
                    Text('TAMANHO HECTARES', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('125,5',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
                    Text('FAZENDA', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('FAZENDA PRIMAVERA',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        fixedSize: Size(110, 30),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('EXCLUIR'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, // Cor de fundo do botão
                        backgroundColor: Color.fromRGBO(255, 0, 0, 1), // Cor do texto do botão quando pressionado
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Borda arredondada do botão
                        ),
                        fixedSize: Size(110, 30),
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('COD.', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('0002', style: TextStyle(fontWeight: FontWeight.bold,))
                  ],
                ),
              ],
            ),
          ),),
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
                'COLABORADORES',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Divider(
                  color: Colors.black,
                  thickness: 1.5,
                ),
              ),
            ],
          )),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 340,
            height: 210,
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
                    Text('DATA INICIAL', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('21/02/2024',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
                    Text('DATA FINAL', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('04/04/2024',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
                    Text('NOME', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('MILHO 14H BAYER',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
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
                        fixedSize: Size(110, 30),
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
                    Text('NOME', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('TALHAO8',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
                    Text('TAMANHO HECTARES', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('125,5',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
                    Text('FAZENDA', style: TextStyle(fontSize: 11,),),
                    SizedBox(height: 2,),
                    Text('FAZENDA PRIMAVERA',style: TextStyle(fontWeight: FontWeight.bold,)),
                    SizedBox(height: 2,),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('EXCLUIR'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, // Cor de fundo do botão
                        backgroundColor: Color.fromRGBO(255, 0, 0, 1), // Cor do texto do botão quando pressionado
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Borda arredondada do botão
                        ),
                        fixedSize: Size(110, 30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('NOVO COLABORADOR', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black, 
              backgroundColor: Color.fromRGBO(
                  61, 190, 1, 1),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0), // Borda arredondada do botão
              ),
              fixedSize: Size(270, 45),
            ),
          ),
        ],
      ),
    );
  }
}
