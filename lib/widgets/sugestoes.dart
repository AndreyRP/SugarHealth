import 'package:flutter/material.dart';

import '../classes/refeiçao.dart';

Widget Sugestoes(Refeicao refeicao, String titulo) {
  return Scaffold(
      appBar: AppBar(
        title: Text(titulo,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xffB4EAE1),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(vertical: 0),
                      child: GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisExtent: 35,
                          children: List<Widget>.generate(refeicao.sugestoes.length, (index){
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
                    SizedBox(height: 24),
                    Text('Explicação da Sugestão',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(refeicao.explicacao, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                  ],
                ),
              )
          )
      )
  );
}