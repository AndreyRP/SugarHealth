import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/CadastrarDieta.dart';
import 'package:sugarhealth/widgets/cabecalho.dart';
import 'package:sugarhealth/widgets/menuRetratio.dart';

import '../widgets/dietaSugestao.dart';

class Dieta extends StatefulWidget {
  const Dieta({super.key});

  @override
  State<Dieta> createState() => _DietaState();
}

class _DietaState extends State<Dieta> {

  int? _opcaoSelecionada = 0;

  final List<String> _opcoes = ['Sugestão', 'Sua Dieta', 'Criar'];

  // --- chama as telas dependendo do que for selecionado ---
  Widget _carregarConteudo() {
    switch (_opcaoSelecionada) {
      case 0:
        return DietaSugestao(opcao: 0);
      case 1:
        return DietaSugestao(opcao: 1);
      case 2:
        return Cadastrardieta();
      default:
        return const Center(child: Text('Nenhuma opção selecionada'));
    }
  }


  // --- Menu selecional de 3 opçoes ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Cabecalho(),
      drawer: MenuRetratio(),
      backgroundColor: const Color(0xff1AB0A0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _opcoes[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 4.0),
                              height: 2.0,
                              width: 80.0,
                              color: isSelected ? Colors.black : Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              // --- chamada funcao para carregar as telas ---
              Container(child: _carregarConteudo()),
            ],
          ),
        ),
      ),
    );
  }
}
