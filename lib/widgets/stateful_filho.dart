import 'package:flutter/material.dart';

class StatefulFilho extends StatefulWidget {
  final Color cor;
  const new({super.key, required this.cor});

  @override
  State<StatefulFilho> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<StatefulFilho> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: widget.cor,
      child: Center(
        child: Text('Cor Atual', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
