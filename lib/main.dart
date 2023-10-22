import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String infoText = 'Informe seus dados.';

  void resetFields() {
    setState(() {
      weightController.clear();
      heightController.clear();
      infoText = 'Informe seus dados.';
    });
  }

  void calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;

    double imc = weight / (height * height);

    setState(() {
      if(imc < 18.6){
        infoText = 'Abaixo do peso (imc ${imc.toStringAsPrecision(2)})';
      }
      else if(imc >= 18.6 && imc < 24.9){
        infoText = 'Peso ideal (imc ${imc.toStringAsPrecision(2)})';
      }
      else if(imc >= 24.9 && imc < 29.9){
        infoText = 'Levemente acima do peso (imc ${imc.toStringAsPrecision(2)})';
      }
      else if(imc >= 29.9 && imc < 34.9){
        infoText = 'Obesidade grau I (imc ${imc.toStringAsPrecision(2)})';
      }
      else if(imc >= 34.9 && imc < 39.9){
        infoText = 'Obesidade grau I (imc ${imc.toStringAsPrecision(2)})';
      }
      else if(imc >= 40){
        infoText = 'Obesidade grau I (imc ${imc.toStringAsPrecision(2)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: resetFields,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
                Icons.person_outline,
                size: 120, color:
            Colors.green
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: weightController,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: heightController,
              decoration: const InputDecoration(
                labelText: 'Altura (cm)',
                labelStyle: TextStyle(color: Colors.green),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: calculate,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(8))
              ),
              child: const Text(
                'Calcular',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              infoText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
