import 'package:flutter/material.dart';

class RegistroTreino extends StatefulWidget {
  final bool isPreenchido;
  final String tituloDia;
  final Function(String inicio, String fim) onSalvarHorarios;
  final VoidCallback onFechar;

  const RegistroTreino({
    super.key,
    required this.isPreenchido,
    required this.tituloDia,
    required this.onSalvarHorarios,
    required this.onFechar,
  });

  @override
  State<RegistroTreino> createState() => _RegistroTreinoState();
}

class _RegistroTreinoState extends State<RegistroTreino> {
  final TextEditingController _inicioController = TextEditingController();
  final TextEditingController _fimController = TextEditingController();

  @override
  void dispose() {
    _inicioController.dispose();
    _fimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.tituloDia,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                ),
                GestureDetector(
                  onTap: widget.onFechar,
                  child: const Icon(Icons.close, color: Colors.white, size: 18),
                )
              ],
            ),
            const SizedBox(height: 12),

            _buildCampoTextoReal(_inicioController, 'Horário de Início (Ex: 20:00)'),
            const SizedBox(height: 10),
            _buildCampoTextoReal(_fimController, 'Horário de Fim (Ex: 21:15)'),

            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.arrow_circle_right, color: Color(0xFF00A88F), size: 36),
                onPressed: () {
                  String inicio = _inicioController.text.isEmpty ? "00:00" : _inicioController.text;
                  String fim = _fimController.text.isEmpty ? "00:00" : _fimController.text;

                  widget.onSalvarHorarios(inicio, fim);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCampoTextoReal(TextEditingController controller, String dica) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black, fontSize: 13),
        keyboardType: TextInputType.datetime,
        decoration: InputDecoration(
          icon: const Icon(Icons.arrow_right, color: Colors.grey, size: 18),
          hintText: dica,
          hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }
}