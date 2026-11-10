import 'package:flutter/material.dart';
import 'package:app_clima_tempo/widgets/stateful_filho.dart';

class StatefulPai extends StatefulWidget {
  const new({super.key});

  @override
  State<StatefulPai> createState() => _StatefulPaiState();
}

class _StatefulPaiState extends State<StatefulPai> {
  Color corAtual = Colors.blue;

  void trocarCor() {
    setState(() {
      corAtual = corAtual == Colors.blue ? Colors.purple : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ciclo de vida Stateful')),
      body: Column(
        children: [
          Text('Ciclo de vida', textAlign: TextAlign.center),
          SizedBox(height: 20),
          StatefulFilho(cor: corAtual),
          SizedBox(height: 20),
          ElevatedButton(onPressed: trocarCor, child: Text('Trocar cor')),
        ],
      ),
    );
  }
}
