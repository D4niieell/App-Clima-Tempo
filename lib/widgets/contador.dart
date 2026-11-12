import 'package:flutter/material.dart';

// StatefulWidget: precisa guardar um valor que muda (o contador).
class ContadorScreen extends StatefulWidget {
  const ContadorScreen({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<ContadorScreen> {
  // Estado: quantidade de cidades favoritas.
  int _favoritas = 0;

  void _incrementar() {
    // setState avisa o Flutter para reconstruir a tela com o novo valor.
    setState(() {
      _favoritas++;
    });
  }

  void _decrementar() {
    setState(() {
      if (_favoritas > 0) _favoritas--; // não deixa ficar negativo
    });
  }

  void _zerar() {
    setState(() {
      _favoritas = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contador de cidades favoritas')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cidades favoritas:'),
            const SizedBox(height: 8),
            Text('$_favoritas', style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementar,
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _incrementar,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextButton(onPressed: _zerar, child: const Text('Zerar')),
          ],
        ),
      ),
    );
  }
}
