// Importa o pacote Material, com MaterialApp, Scaffold, AppBar, ListView, Row etc.
import 'package:flutter/material.dart';

// Importa o widget personalizado que criamos para os títulos das seções.
import 'widgets/titulo_secao.dart';

// Função principal: o ponto de entrada do aplicativo.
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // runApp infla o widget raiz (MyApp) e o coloca na tela.
  runApp(const MyApp());
}

// Widget raiz do app. È Stateless porque nesta etapa a tela é estática.
class MyApp extends StatelessWidget {
  // Construtor constante com a chave opcional repassada ao StatelessWidget.
  const MyApp({super.key});

  // build descreve a interface do Widget.
  @override
  Widget build(BuildContext context) {
    // MaterialApp configura o app com o estilo Material Design.
    return MaterialApp(
      // Scaffold( fornece a estrutura básica de uma tela (AppBar, body, etc.)
      home: Scaffold(
        // Barra superior do app.
        appBar: AppBar(
          // Título da barra: um Text com "WeatherApp".
          title: const Text('WeatherApp'),
        ),
        // Corpo da tela: um ListView (lista rolável) com vários filhos.
        body: ListView(
          // Espaçamento interno de 16 em todos os lados.
          padding: const EdgeInsets.all(16),
          // ListView tem vários filhos, então usa "children" com uma lista de widgets.
          children: [
            // ------------- a) CIDADE ATUAL -------------
            // Título da seção usando o widget personalizado.
            const TituloSecao(titulo: 'Cidade atual'),
            // Nome da cidade em 28 negrito.
            const Text(
              'Santo André', // Nome da cidade
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            // Data e dia da semana em tamanho 16 (texto fixo).
            const Text(
              'Segunda-feira, 19 de outubro',
              style: TextStyle(fontSize: 16),
            ),
            // Linha divisória entre as seções.
            const Divider(),

            // ------------- b) TEMPERATURA -------------
            // Título da seção.
            const TituloSecao(titulo: 'Temperatura'),
            // Temperatura atual em tamanho 48, negrito e com cor escolhida.
            const Text(
              '26°C',
              style: TextStyle(
                fontSize: 48, // Tamanho 48 pedido do exercicio
                fontWeight: FontWeight.bold, // Negrito.
                color: Colors.orange, // Cor de sua preferência
              ),
            ),
            // Sensação téwrmica em tamanho 16, sem negrito (peso padrão).
            const Text(
              'Sensação térmica: 28°C',
              style: TextStyle(fontSize: 16),
            ),
            // Linha divisória.
            const Divider(),

            // ------------- c) CONDIÇÃO DO TEMPO -------------
            // Título da seção.
            const TituloSecao(titulo: 'Condição do tempo'),
            // Imagem carregada da internet pela URL.
            Image.network(
              'https://fastly.picsum.photos/id/10/2500/1667.jpg?hmac=J04WWC_ebchx3WwzbM-Z4_KC_LeLBWr5LZMaAkWkF68', // URL da imagem
              height: 200, // Altura de 200, como pedido.
            ),
            // Linha divisória.
            const Divider(),

            // ------------- d) DETALHES -------------
            // Título da seção.
            const TituloSecao(titulo: 'Detalhes'),
            // Primeira Row: os três ícones lado a lado
            const Row(
              // spaceAround distribui o espaço livre ao redor de cada filho.
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // Row tem vários filhos, então usa "children".
              children: [
                // Ícone de umidade.
                Icon(Icons.water_drop, color: Colors.blue, size: 32),
                // Ícone de vento.
                Icon(Icons.air, color: Colors.grey, size: 32),
                // Ícone de probabilidade de chuva.
                Icon(Icons.umbrella, color: Colors.amber, size: 32),
              ],
            ),
            // Segunda Row: os valores correspondentes abaixo de cada ícone.
            const Row(
              // Mesmo alinhamento para os textos ficarem sob os ícones.
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('65%'), // Umidade
                Text('12 km/h'), // Velocidade do vento
                Text('30%'), // Probabilidade de chuva.
              ],
            ),
            // Linha divisória.
            const Divider(),

            // ------------- e) ATUALIZAÇÃO -------------
            // Título da seção.
            const TituloSecao(titulo: 'Atualização'),
            // Botão elevado com o texto "Atualizar".
            ElevatedButton(
              onPressed: () {}, // Função vazia por enquanto, como pedido.
              child: const Text(
                'Atualizar',
              ), // Botão tem um único filho, então usa "child".
            ),
          ],
        ),
      ),
    );
  }
}
