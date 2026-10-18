import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/cabecalho.dart';
import '../widgets/menuRetratio.dart';
import '../widgets/textoAvaliacao.dart';

class PgPerfilUsuario extends StatefulWidget {
  const PgPerfilUsuario({super.key});

  @override
  State<PgPerfilUsuario> createState() => _PgPerfilUsuarioState();
}

class _PgPerfilUsuarioState extends State<PgPerfilUsuario> {

  bool _isOpen = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Cabecalho(),
      drawer: MenuRetratio(),
      backgroundColor: const Color(0xffB4EAE1),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),

          GestureDetector(
            onTap: () {
              setState(() {
                _isOpen = !_isOpen;
              });
            },
            child: _isOpen ?
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 60,
                        height: 60,
                      ),

                      SizedBox(height: 12,),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextoAvaliacao('Nome: '),
                            SizedBox(width: 12),
                            Expanded(child: TextoAvaliacao('Jose Manual Lopez'))
                            ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextoAvaliacao('E-Mail: '),
                            SizedBox(width: 12),
                            Expanded(child: TextoAvaliacao('JoseLopez@gmail.com'))
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextoAvaliacao('Telefone: '),
                            SizedBox(width: 12),
                            Expanded(child: TextoAvaliacao('45 9 9999-5555'))
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextoAvaliacao('Diabetes: '),
                            SizedBox(width: 12),
                            Expanded(child: TextoAvaliacao('Tipo 1'))
                          ]
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextoAvaliacao('Data Nacimento: '),
                            SizedBox(width: 12),
                            Expanded(child: TextoAvaliacao('20/03/2000'))
                          ]
                      ),

                      SizedBox(height: 12,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(onPressed: () => (),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff97F8ED),
                                side: const BorderSide(color: Colors.black, width: 2.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                minimumSize: const Size(220, 42),
                              ),
                              child: TextoAvaliacao('Editar')),

                          Icon(
                            Icons.keyboard_arrow_up,
                            size: 30,
                          ),
                        ],
                      )

                    ]
                )
            )
                : Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child:
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 40,
                        height: 40,
                      ),

                      TextoAvaliacao('Nome do Usuario'),

                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                      ),
                    ]
                )
            ),
          ),

              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.bar_chart),
                        SizedBox(width: 12,),
                        TextoAvaliacao('Graficos'),
                      ]
                  )
              ),

              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.analytics),
                        SizedBox(width: 12,),
                        TextoAvaliacao('Avaliação Fisica'),
                      ]
                  )
              ),

              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.fitness_center),
                        SizedBox(width: 12,),
                        TextoAvaliacao('Treinos'),
                      ]
                  )
              ),

              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.calendar_month),
                        SizedBox(width: 12,),
                        TextoAvaliacao('Minha Frequência'),
                      ]
                  )
              ),

              SizedBox(height: 90),

              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.engineering),
                        SizedBox(width: 12,),
                        TextoAvaliacao('Configurações'),
                      ]
                  )
              ),

              ElevatedButton(onPressed: () => (),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff97F8ED),
                    side: const BorderSide(color: Colors.black, width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    minimumSize: const Size(220, 42),
                  ),
                  child: TextoAvaliacao('Sair')),
            ],
        ),
    )
      ),
    );
  }
}

