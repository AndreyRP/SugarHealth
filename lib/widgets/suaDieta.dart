import 'package:flutter/material.dart';
import 'package:sugarhealth/classes/cadastroDieta.dart';

Widget SuaDieta(@required SuaRefeicao refeicao) {

  // --- menu para dieta cadastrada pelo usuario ---
  return Container(
    color: const Color(0xffBCEAE5),
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: List<Widget>.generate(refeicao.pratos.length, (index) {
            final prato = refeicao.pratos[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: .start,
                children: [

                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(prato.nomePrato,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

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
                        child: Text('${prato.quantidade} ${prato.medida}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    ),
  );
}