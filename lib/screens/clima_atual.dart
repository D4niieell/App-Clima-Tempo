import 'package:app_clima_tempo/widgets/titulo_secao.dart';
import 'package:flutter/material.dart';
// import '../widgets/titulo_secao.dart';

// ../ sobe uma pasta (de screens para lib) e entra em widgets

class ClimaAtualScreen extends StatelessWidget {
  const ClimaAtualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clima atual')),
      // ListView permite rolar a tela se o conteúdo for grande
      body: ListView(
        children: [
          // ---------- a) CIDADE ATUAL ----------
          const TituloSecao(titulo: 'Cidade atual'),
          // Container pinta o fundo de azul claro
          Container(
            color: Colors.lightBlue.shade100, // cor de fundo
            // Padding cria um espaço interno de 20px em todos os lados
            child: Column(
              // Alinha os textos à  esquerda
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Santo André', style: TextStyle(fontSize: 24)),
                Text('São Paulo, Brasil.'),
              ],
            ),
          ),

          Divider(), // linha separadora
          // ---------- b) TEMPERATURA ----------
          const TituloSecao(titulo: 'Temperatura'),
          // Center centraliza o filho horizontalmente
          Center(
            child: Column(
              // mainAxisSize.min: a Colunm coupa só o espaço necessário
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('26°C', style: TextStyle(fontSize: 48)),
                // SizeBox cria um espaço vazio de 8px de altura
                SizedBox(height: 8),
                Text('Sensação térmica: 28°C'),
              ],
            ),
          ),
          Divider(),

          // ---------- d) DETALHES ----------
          const TituloSecao(titulo: 'Detalhes'),
          // Primeira Row: os rótulos
          const Row(
            // spaceAround: espaço igual ao redor de cada filho
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text('Umidade'), Text('Vento'), Text('Pressão')],
          ),
          // Padding só no top (8px) para afastar da Row de cima
          const Padding(
            padding: EdgeInsetsGeometry.only(top: 8),
            // Segunda Row: os valores
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text('65%'), Text('12 km/h'), Text('1013 hPa')],
            ),
          ),
          Divider(),

          // ---------- e) ATUALIZAÇÃO ----------
          const TituloSecao(titulo: 'Atualização'),
          // Center centraliza o botão
          Center(
            child: ElevatedButton(
              onPressed: () {}, // por enquanto não faz nada
              child: const Text('Atualizar'),
            ),
          ),

          const SizedBox(height: 16), // espaço de 16px abaixo do botão
          // Container com altura definida: dá  "espaço" para o Align trabalhar
          Container(
            height: 80,
            color: Colors.grey.shade200,
            // Align posiciona o filho dentro do espaço do Container
            child: const Align(
              alignment: Alignment.bottomRight, // canto inferior direito
              child: Text('Ultima atualização: 19:30'),
            ),
          ),
        ],
      ),
    );
  }
}
