import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/sugestoes.dart';

import '../classes/refeiçao.dart';


// --- menu para sugestao do sistema na dieta ---
Widget MenuDieta(@required Refeicao refeicao, BuildContext context) {
  final macros = refeicao.listaNutrientes[0].todosOsMacros;
  double soma = 0;

  for (var macro in macros) {
    String textoLimpo = macro[0].replaceAll(',', '.').trim();

    double valor = double.tryParse(textoLimpo) ?? 0.0;
    soma += valor;
  }

  return Container(
    color: const Color(0xffBCEAE5),
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: List<Widget>.generate(macros.length, (index) {
            final macrosAtual = macros[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: .start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xffA8D3F6),
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text('${macrosAtual[0]} g',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(macrosAtual[1],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        SizedBox(height: 12),

        // --- soma as calorias totais ---
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffA8D3F6),
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text('${soma} calorias',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),),
          ),
        ),

        SizedBox(height: 12),

        Row(
          children: [
            Text('Sugestão:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
            SizedBox(width: 20,),
            Text('Glicemia Baixa',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ],
        ),

        SizedBox(height: 20,),

        // --- lista as primeiras 10 sugestoes ---
        Padding(padding: EdgeInsets.symmetric(vertical: 0),
          child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisExtent: 35,
              children: List<Widget>.generate(10, (index){
                final sugestao = refeicao.sugestoes[index];

                return Text(sugestao,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )
                );
              })
          ),
        ),

        // --- Abre uma tela por cimas para estar apresentando todas as sugestoes e exolicaçao ---
        Align(
          alignment: .centerLeft,
          child: TextButton(
            style: ButtonStyle(
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              minimumSize: WidgetStateProperty.all(Size.zero),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sugestoes(refeicao, 'Glicemia Baixa')),
              );
            },
            child: const Text(
              'Outras Opções',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xff3D6490),
              ),
            ),

          ),
        )

      ],
    ),
  );
}