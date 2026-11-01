import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sugarhealth/widgets/DecoracoesStyle.dart';
import 'package:sugarhealth/widgets/textos.dart';

import '../widgets/cabecalho.dart';
import '../widgets/menuRetratio.dart';

class PgChatprivado extends StatefulWidget {
  const PgChatprivado({super.key});

  @override
  State<PgChatprivado> createState() => _PgChatprivadoState();
}

class _PgChatprivadoState extends State<PgChatprivado> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Cabecalho(),
      drawer: MenuRetratio(),
      backgroundColor: Color(0xff1AB0A0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Encosta o botão à esquerda do ecrã
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(left: 16, bottom: 8, top: 16),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_back, size: 24, color: Colors.black, fontWeight: .bold,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),

              SizedBox(height: 6),

              Container(
                padding: EdgeInsetsGeometry.fromLTRB(0, 0, 0, 16),
                margin: EdgeInsets.fromLTRB(16, 0, 16, 20),
                height: min(600, 500),
                width: min(1000, 1000),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Column(
                  spacing: 8,
                  mainAxisAlignment: .start,

                  children: [
                    Container(
                      padding: .symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: Color(0xffB4EAE1),
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        spacing: 12,
                        mainAxisAlignment: .start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 2),
                          Image.asset('assets/images/logo.png',
                            height: 40,
                            width: 40,
                          ),

                          Expanded(
                            child: Text(
                              'Nome do Usuario',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 8,),

                    MensagemRetorno('Oi!'),
                    MensagemRetorno('Hoje o Vasco vai tomar taca'),
                    MensagemRetorno('4x0 pra nos'),
                    MensagemUsuario('Hoje nos bate nos nosso filho sem remorso, vamos ensinar que rebaixado não deve jogar Semifinal,'
                        '4x0 é pouco no minimo 7.')
                  ],
                ),
              ),
            ],
          )
        ),
      ),

      // --- Botão Flutuante Fixo no Canto Inferior Direito ---
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Campo de Texto para digitar a mensagem
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9), // Fundo suave para o input
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Botão Circular de Enviar
              GestureDetector(
                onTap: () {
                  // Lógica de envio da mensagem privada
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF17B890), // Cor verde-água padrão
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Icon(
                    Icons.send, // Ícone de enviar
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MensagemUsuario(String texto){
    return Align(
      alignment: .centerRight,
      child: Container(
        // Limita a largura máxima do balão (ex: 75% da largura da tela)
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75, // Máximo 75% da largura do ecrã
            minWidth: 60, // Largura mínima para mensagens muito curtas (ex: "Ok")
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          margin: EdgeInsetsGeometry.only(right: 6),
          decoration: BoxDecoration(
            color: const Color(0xff1AB0A0),
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(2),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: TextoChat(texto)
      ),
    );
  }

  Widget MensagemRetorno(String texto){
    // Balão da Mensagem com "puxadinha" (rabicho) no canto superior esquerdo
    return Align(
      alignment: .centerLeft,
      child: Container(
        // Limita a largura máxima do balão (ex: 75% da largura da tela)
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.75, // Máximo 75% da largura do ecrã
            minWidth: 60, // Largura mínima para mensagens muito curtas (ex: "Ok")
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          margin: EdgeInsetsGeometry.only(left: 6),
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
          child: TextoChat(texto)
      ),
    );
  }

}


