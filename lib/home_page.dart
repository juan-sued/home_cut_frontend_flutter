import 'package:flutter/material.dart';

//desenha na tela
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

//gerencia estado
class _HomePageState extends State<HomePage> {
  var counter = 0;

  final listNames = [
    'Juan',
    'Alê',
    'Renan',
    'Lorena',
    'Juan',
    'Alê',
    'Renan',
    'Lorena',
    'Juan',
    'Alê',
    'Renan',
    'Lorena',
    'Juan',
    'Alê',
    'Renan',
    'Lorena',
    'Juan',
    'Alê',
    'Renan',
    'Lorena',
    'Juan',
    'Alê',
    'Renan',
    'Lorena'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              scrollDirection: Axis.horizontal,
              itemCount: listNames.length,
              itemBuilder: (context, index) {
                final name = listNames[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.all(20),
                  constraints: const BoxConstraints(minWidth: 100),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.brown.shade300,
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 2),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          counter++;
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
