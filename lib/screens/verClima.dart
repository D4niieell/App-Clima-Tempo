import 'package:app_clima_tempo/widgets/titulo_secao.dart';
import 'package:flutter/material.dart';
import 'package:app_clima_tempo/models/clima.dart';

class MyWidget extends StatelessWidget {
  final Clima clima;
  const new({super.key, required this.clima});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Previsão do tempo')),
      body: Center(
        child: Column(
          children: [
            TituloSecao(titulo: 'Informações sobre o clima de ${clima.cidade}'),
            SizedBox(height: 20),
            Text('Temperatura atual: ${clima.temperaturaAtual} °C'),
            Text('Temperatura mínima: ${clima.temperaturaMinima}'),
            Text('Temperatura máxima: ${clima.temperaturaMaxima}'),
            Text('Umidade: ${clima.umidade}'),
            Text('Chance de chuva: ${clima.chanceChuva}'),
          ],
        ),
      ),
    );
  }
}
