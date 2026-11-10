// Atividade escalonamento
// Adapte a interface de clima para que 1 única tela "ver_clima" e 1 única tela "previsao_semana" sirvam para apresentar
// informações de infinitas cidades.

import 'package:flutter/material.dart';
import 'package:app_clima_tempo/widgets/titulo_secao.dart';
import 'package:app_clima_tempo/models/clima.dart';
import 'package:app_clima_tempo/screens/previsao_semana.dart';

class VerClima extends StatelessWidget {
  final Clima clima;
  const VerClima({super.key, required this.clima});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Previsão do tempo')),
      body: Center(
        child: Column(
          children: [
            TituloSecao(titulo: 'Informações sobre o clima de ${clima.cidade}'),
            SizedBox(height: 20),
            Text(
              'Temperatura atual: ${clima.temperaturaAtual.toStringAsFixed(0)} °C',
            ),
            Text(
              'Temperatura mínima: ${clima.temperaturaMinima.toStringAsFixed(0)} °C',
            ),
            Text(
              'Temperatura máxima: ${clima.temperaturaMaxima.toStringAsFixed(0)} °C',
            ),
            Text('Umidade: ${clima.umidade}%'),
            Text('Chance de chuva: ${clima.chanceChuva}%'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrevisaoSemanaScreen(clima: clima),
                  ),
                );
              },
              child: const Text('Previsão da Semana'),
            ),
          ],
        ),
      ),
    );
  }
}
