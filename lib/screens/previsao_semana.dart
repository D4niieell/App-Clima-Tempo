import 'package:app_clima_tempo/models/clima.dart';
import 'package:app_clima_tempo/widgets/titulo_secao.dart';
import 'package:flutter/material.dart';

// import '../widgets/linha_previsao.dart';
// import '../widgets/titulo_secao.dart';

class PrevisaoSemanaScreen extends StatelessWidget {
  final Clima clima;
  const PrevisaoSemanaScreen({super.key, required this.clima});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Previsão da semana')),
      body: ListView(
        // Espaço de 16px nas bordas da lista inteira
        padding: const EdgeInsets.all(16),
        children: [
          // ---------- a) FAIXA DE TEMPERATURA ----------
          const TituloSecao(titulo: 'Faixa de temperatura'),
          Row(
            children: [
              // Extended: ocupa o espaço disponível (flex padrão = 1)
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.lightBlue.shade200,
                  // Center centraliza o texto dentro do Container
                  child: const Center(child: Text('18°C')),
                ),
              ),
              // Flexibele com flex: 2 ocupa o DOBRO dos outros
              Flexible(
                flex: 2,
                child: Container(
                  height: 60,
                  color: Colors.amber.shade200,
                  child: const Center(child: Text('26°')),
                ),
              ),
              Expanded(
                child: Container(
                  height: 60,
                  color: Colors.red.shade200,
                  child: const Center(child: Text('31°C')),
                ),
              ),
            ],
          ),
          Divider(),

          // ---------- b) RESUMO DO DIA ----------
          const TituloSecao(titulo: 'Resumo do dia'),
          // Container pai com altura definida (a Column precisa de limite)

          Container(
            height: 200,
            color: Colors.green.shade50,
            child: Column(
              children: [
                // Manhã: 1 parte da altura
                Expanded(
                  child: Container(
                    color: Colors.orange.shade200,
                    // Center só dá efeito porque o Container preenche o Expanded
                    child: const Center(child: Text('Manhã: 20°C')),
                  ),
                ),
                // Tarde: 2 partes da altura
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.deepOrange.shade200,
                    child: const Center(child: Text('Tarde: 29°C')),
                  ),
                ),
              ],
            ),
          ),
          Divider(),

          // ---------- c) PRÓXIMOS DIAS ----------
          const TituloSecao(titulo: 'Próximos dias'),
          // Cada linha tem um Padding vertical de 8
          Padding(
            // symmetric: define vertical e/ou horizontal de uma vez
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: const [
                // flex: 2 -> o nome do dia ganha mais espaço
                Expanded(flex: 2, child: Text('Sexta')),
                // Ícone de tamanho 28
                Icon(Icons.wb_sunny, size: 28),
                Expanded(child: Text('18°C')), // minima
                Expanded(child: Text('30°C')), // máxima
              ],
            ),
          ),
          // Repita o bloco acima mais 4 vezes: Sábado, Domingo, Segunda, Terça
          // (troque o dia, o ícone e as temperaturas)
        ],
      ),
    );
  }
}
