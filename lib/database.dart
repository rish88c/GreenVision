import 'package:flutter/material.dart';

class Database extends StatelessWidget{
  const Database({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database'),
        centerTitle: true,
        backgroundColor: Colors.teal.shade300,

      ),
      body: const Center(child: Text('Database'),),
    );
  }


}