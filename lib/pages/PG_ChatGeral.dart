import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarhealth/pages/PG_ChatComunidade.dart';
import 'package:sugarhealth/pages/PG_ChatPrivado.dart';
import 'package:sugarhealth/widgets/DecoracoesStyle.dart';
import 'package:sugarhealth/widgets/textos.dart';

import '../widgets/cabecalho.dart';
import '../widgets/menuRetratio.dart';
import 'editarAvaliacao.dart';

class PgChatgeral extends StatefulWidget {
  PgChatgeral({super.key});

  @override
  State<PgChatgeral> createState() => _PgChatgeralState();
}

class _PgChatgeralState extends State<PgChatgeral> {
  int _opcaoSelecionada = 0;

  final List<String> _opcoes = ['Conversas', 'Comunidades'];

  Widget _carregarConteudo() {
    switch (_opcaoSelecionada) {
      case 0:
        return Conversas();
      case 1:
        return Comunidade();
      default:
        return Center(child: Text('Nenhuma opção selecionada'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Cabecalho(),
      drawer: MenuRetratio(),
      backgroundColor: Color(0xff1AB0A0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
            decoration: FundoCorBorPretas(0xffffffff, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List<Widget>.generate(_opcoes.length, (int index) {
                      final bool isSelected = _opcaoSelecionada == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _opcaoSelecionada = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                _opcoes[index],
                                style: TextStyle(
                                  color: isSelected ? Colors.blue : Colors.black,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4.0),
                                height: 2.0,
                                width: 80.0,
                                color: isSelected ? Colors.blue : Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 12),

                // --- Carrega a lista ---
                _carregarConteudo(),
              ],
            ),
          ),
        ),
      ),

      // --- Botão Flutuante Fixo no Canto Inferior Direito ---
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:  GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditarMedidas()),
          ).then((_) {
            setState(() {});
          });
        },
        child: Container(
          margin: EdgeInsets.only(right: 12, bottom: 12),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xFF17B890),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget Conversas() {
    List<Contato> contatos = [
      Contato('assets/images/logo.png', 'Jose Manuel Lopez'),
      Contato('assets/images/logo.png', 'Vitor Roque'),
      Contato('assets/images/logo.png', 'Joaquim Piquerez'),
      Contato('assets/images/logo.png', 'Gustavo Gomes'),
      Contato('assets/images/logo.png', 'Arthur Augusto'),
      Contato('assets/images/logo.png', 'Agustim Gyai'),
      Contato('assets/images/logo.png', 'Gustavo Gomes'),
      Contato('assets/images/logo.png', 'Arthur Augusto'),
      Contato('assets/images/logo.png', 'Agustim Gyai'),
    ];

    return Column(
      children: [
        ...List<Widget>.generate(contatos.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PgChatprivado()),
              ).then((_) {
                setState(() {});
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Color(0xffB4EAE1),
                border: Border(
                  top: BorderSide(color: Colors.black, width: 2),
                  bottom: BorderSide(color: Colors.black, width: 0),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(contatos[index].caminhoImagem),
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: TextoPadrao(contatos[index].nomeContato),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget Comunidade() {
    List<Contato> contatos = [
      Contato('assets/images/logo.png', 'Jose Manuel Lopez'),
      Contato('assets/images/logo.png', 'Vitor Roque'),
      Contato('assets/images/logo.png', 'Joaquim Piquerez'),
      Contato('assets/images/logo.png', 'Gustavo Gomes'),
      Contato('assets/images/logo.png', 'Arthur Augusto'),
      Contato('assets/images/logo.png', 'Agustim Gyai'),
    ];

    return Column(
      children: [
        ...List<Widget>.generate(contatos.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PgChatcomunidade()),
              ).then((_) {
                setState(() {});
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Color(0xffB4EAE1),
                border: Border(
                  top: BorderSide(color: Colors.black, width: 2),
                  bottom: BorderSide(color: Colors.black, width: 0),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1.5),
                    ),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(contatos[index].caminhoImagem),
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: TextoPadrao(contatos[index].nomeContato),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class Contato {
  late String caminhoImagem;
  late String nomeContato;
  late bool mensagemNova;
  late int mensagensNaoLidas;

  Contato(this.caminhoImagem, this.nomeContato);
}