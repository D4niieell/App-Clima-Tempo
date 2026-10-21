// Importa o pacote Material, que traz Text, TextStyle, Colors, StatelessWidget etc.
import 'package:flutter/material.dart';

// Widget personalizado para os títulos de cada seção da tela.
// Estude StatelessWidget porque não tem estado que muda (é só um texto estilizado).
class TituloSecao extends StatelessWidget {
  // Parâmetro que aguarda o texto do titulo. "final" porque widgets são imutáveis.
  final String titulo;

  // Constructor constante. "required" torna o parâmetro obrigatório (exigido no exercício).
  // "super.key" repassa a chave opcional para a classe pai (StatelessWidget).
  const new({super.key, required this.titulo});

  // O método build descreve a interface que este widget desenha na tela.
  @override
  Widget build(BuildContext context) {
    // Retorna um Text com o título recebido por parâmetro.
    return Text(
      titulo, // Texto exibido: o valor passado ao criar o TituloSecao.)
      // Define o estilo do texto, centralizado aqui para não repetir nas seções.
      style: const TextStyle(
        fontSize: 20, // Tamanho da fonte pedido no exercício.
        fontWeight: FontWeight.bold, // Negrito, também pedido no exercício.
        color: Colors
            .blue, // Cor de destaque (você pode trocar pela que preferir).
      ),
    );
  }
}
