import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/DecoracoesStyle.dart';

import '../widgets/cabecalho.dart';
import '../widgets/menuRetratio.dart';

class PgChatcomunidade extends StatefulWidget {
  const PgChatcomunidade({super.key});

  @override
  State<PgChatcomunidade> createState() => _PgChatcomunidadeState();
}

class _PgChatcomunidadeState extends State<PgChatcomunidade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Cabecalho(),
      drawer: MenuRetratio(),
      backgroundColor: Color(0xff1AB0A0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsetsGeometry.fromLTRB(0, 24, 0, 16),
            margin: EdgeInsets.fromLTRB(16, 20, 16, 20),
            height: min(600, 500),
            width: min(1000, 1000),
            decoration: FundoCorBorPretas(0xffffffff, 20),
            child: Column(

              children: [
                Row(
                  spacing: 12,
                  mainAxisAlignment: .start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 2),
                    Image.asset('assets/images/logo.png',
                      height: 40,
                      width: 40,
                    ),

                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Nome do Usuário
                              Text(
                                'Nome do Usuario',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(height: 8),

                              // Balão da Mensagem com "puxadinha" (rabicho) no canto superior esquerdo
                              Container(
                                // Limita a largura máxima do balão (ex: 75% da largura da tela)
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width * 0.75, // Máximo 75% da largura do ecrã
                                  minWidth: 60, // Largura mínima para mensagens muito curtas (ex: "Ok")
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                                margin: EdgeInsetsGeometry.only(right: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xff1AB0A0),
                                  border: Border.all(color: Colors.black, width: 1.5),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(2),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  'Oi!', // Se for um texto curto, o balão fica pequeno. Se for longo, cresce até ao limite!
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ])
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
