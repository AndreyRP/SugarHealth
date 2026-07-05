import 'package:flutter/material.dart';

class SelecaoTreino extends StatefulWidget {
  final Function(List<String>) onAvancar;
  final VoidCallback onFechar;

  const SelecaoTreino({
    super.key,
    required this.onAvancar,
    required this.onFechar,
  });

  @override
  State<SelecaoTreino> createState() => _SelecaoTreinoState();
}

class _SelecaoTreinoState extends State<SelecaoTreino> {
  final Map<String, bool> treinos = {
    'Costas': false,
    'Perna': false,
    'Ombro': false,
    'Tríceps': false,
    'Bíceps': false,
    'Peito': false,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFD4F4F0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Selecione os Treinos:', style: TextStyle(fontWeight: FontWeight.bold)),
              IconButton(onPressed: widget.onFechar, icon: const Icon(Icons.close)),
            ],
          ),
          Expanded(
            child: ListView(
              children: treinos.keys.map((String chave) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00A88F),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CheckboxListTile(
                    title: Text(
                      chave,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    value: treinos[chave],
                    activeColor: Colors.white,
                    checkColor: const Color(0xFF00A88F),
                    side: const BorderSide(color: Colors.white, width: 2),
                    onChanged: (bool? value) {
                      setState(() {
                        treinos[chave] = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size.fromHeight(45),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              List<String> selecionados = [];
              treinos.forEach((key, val) {
                if (val == true) selecionados.add(key);
              });
              widget.onAvancar(selecionados);
            },
            child: const Text('Avançar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}