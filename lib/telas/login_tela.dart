import 'package:flutter/material.dart';
import 'package:rurallstrong/_comum/meu_snackbar.dart';
import 'package:rurallstrong/servicos/autenticao_servico.dart';
import 'package:rurallstrong/telas/telateste.dart';

class LoginTela extends StatefulWidget {
  const LoginTela({Key? key}) : super(key: key);

  @override
  State<LoginTela> createState() => _LoginTelaState();
}

class _LoginTelaState extends State<LoginTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailControler = TextEditingController();
  TextEditingController _senhaControler = TextEditingController();
  TextEditingController _cnpjControler = TextEditingController();
  TextEditingController _cpfControler = TextEditingController();
  TextEditingController _nomeControler = TextEditingController();
  TextEditingController _celularControler = TextEditingController();

  AutenticaoServico _autenServico = AutenticaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 85, 0, 0),
              height: 150,
              alignment: Alignment.center,
              child: Container(
                child: Image.asset(
                  'assets/APLICATIVO-16.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              padding: const EdgeInsets.all(30),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: TextFormField(
                          controller: _emailControler,
                          decoration: InputDecoration(
                            label: Center(
                              child: Text('E-mail'),
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white, 
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), 
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 7.0),
                                floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          validator: (String? value) {
                            if (value == null) {
                              return "O e-mail não pode ser vazio";
                            }
                            if (value.length < 5) {
                              return "O e-mail é muito curto";
                            }
                            if (!value.contains("@")) {
                              return "E-mail inválido";
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: TextFormField(
                          controller: _senhaControler,
                          decoration: InputDecoration(
                            label: Center(
                              child: Text('Senha'),
                            ),
                            labelStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white, 
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 7.0),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          validator: (String? value) {
                            if (value == null) {
                              return "A senha não pode ser vazio";
                            }
                            if (value.length < 8) {
                              return "A senha é muito curta";
                            }
                            return null;
                          },
                          style: const TextStyle(color: Colors.black),
                          obscureText: true,
                        ),
                      ),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 16, 40, 0),
                              child: TextFormField(
                                controller: _cpfControler,
                                decoration: InputDecoration(
                                  label: Center(
                                    child: Text('CPF'),
                                  ),
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:
                                      Colors.white, // Cor da caixa de fundo
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 7.0),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                ),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "o CPF não pode ser vazio";
                                  }
                                  if (value.length < 11) {
                                    return "O CPF é muito curta";
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                              child: TextFormField(
                                controller: _cnpjControler,
                                decoration: InputDecoration(
                                  label: Center(
                                    child: Text('CNPJ'),
                                  ),
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:
                                      Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 7.0),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                ),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "o CNPJ não pode ser vazio";
                                  }
                                  if (value.length < 14) {
                                    return "O CNPJ é muito curta";
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                              child: TextFormField(
                                controller: _nomeControler,
                                decoration: InputDecoration(
                                  label: Center(
                                    child: Text('Nome'),
                                  ),
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:
                                      Colors.white, // Cor da caixa de fundo
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 7.0),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                ),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "O nome não pode ser vazio";
                                  }
                                  if (value.length < 5) {
                                    return "O nome é muito curto";
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                              child: TextFormField(
                                controller: _celularControler,
                                decoration: InputDecoration(
                                  label: Center(
                                    child: Text('Celular'),
                                  ),
                                  labelStyle: TextStyle(color: Colors.grey),
                                  filled: true,
                                  fillColor:
                                      Colors.white, // Cor da caixa de fundo
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 7.0),
                                      floatingLabelBehavior: FloatingLabelBehavior.never,
                                ),
                                validator: (String? value) {
                                  if (value == null) {
                                    return "O Número do Whatsapp não pode ser vazio";
                                  }
                                  if (value.length < 11) {
                                    return "O Número do Whatsapp é muito curto";
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.black),
                                
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {
                          botaoPrincipalClicado();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Colors.black, // Cor de fundo do botão
                          backgroundColor: Color.fromRGBO(61, 190, 1,
                              1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10.0),
                          ),
                        ),
                        child: Text(
                          (queroEntrar) ? "ENTRAR" : "CADASTRAR",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              Colors.grey[400],
                          backgroundColor: Color.fromRGBO(61, 190, 1,
                              0),
                        ),
                        onPressed: () {
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text(
                          (queroEntrar)
                              ? "CRIAR MEU CADASTRO"
                              : "Já tem uma conta? Entre!",
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            buildMapeChat(context),
          ],
        ),
      ),
    );
  }

  Widget buildMapeChat(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCustomButtonMapeChat(
            'assets/icon-app.png',
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TelaTeste()),
              );
            },
          ),
          SizedBox(width: 70.0),
          _buildCustomButtonMapeChat(
            'assets/icon-chat.png',
            () {
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

  Widget _buildCustomButtonMapeChat(String imagePath, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: Color.fromRGBO(61, 190, 1, 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 75.0,
                height: 75.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  botaoPrincipalClicado() {
    String email = _emailControler.text;
    String senha = _senhaControler.text;
    String cnpj = _cnpjControler.text;
    String cpf = _cpfControler.text;
    String nome = _nomeControler.text;
    String celular = _celularControler.text;
    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        print("Entrada Validada");
        _autenServico
            .logarUsuarios(email: email, senha: senha)
            .then((String? erro) {
          if (erro != null) {
            mostrarSnackBar(context: context, texto: erro);
          }
        });
      } else {
        print("Cadastro Validado");
        _autenServico
            .cadastrarUsuario(
                email: email, senha: senha,cpf: cpf, cnpj: cnpj, nome: nome, celular: celular)
            .then((String? erro) {
          if (erro != null) {
            // Voltou com erro
            mostrarSnackBar(context: context, texto: erro);
          }
        });
      }
    } else {
      print("Form Inválido");
    }
  }
}
