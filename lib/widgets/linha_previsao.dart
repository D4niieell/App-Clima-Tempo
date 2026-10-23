import 'package:flutter/material.dart';

// Widget que representa UMA linha de previsão
class LinhaPrevisao extends StatelessWidget {
  final String dia; // nome do dia ícone
  final IconData icone; // ícone do clima
  final String minima; // temperatura mínima
  final String maxima; // temperatura máxima

  // Todos os pârametros são obrigatórios
  const LinhaPrevisao({
    super.key,
    required this.dia,
    required this.icone,
    required this.minima,
    required this.maxima,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(dia)),
          Icon(icone, size: 28),
          Expanded(child: Text(minima)),
          Expanded(child: Text(maxima)),
        ],
      ),
    );
  }
}
