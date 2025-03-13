import 'package:flutter/material.dart';
import 'calculator_logic.dart';  // Fichier contenant la fonction evaluateExpression()
import 'styles.dart';            // Fichier contenant les styles des boutons

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = "0";   // Valeur affichée pendant la saisie
  String _output = "0";  // Valeur du dernier résultat

  final List<String> _buttons = [
    '7', '8', '9', '/',
    '4', '5', '6', '*',
    '1', '2', '3', '-',
    'C', '0', '=', '+'
  ];



  void _buttonPressed(String value) {
    setState(() {
      switch (value) {
        case 'C':
        // Réinitialise tout
          _input = '0';
          _output = '0';
          break;

        case '⌫':
        // Efface le dernier caractère
          if (_input.length > 1) {
            _input = _input.substring(0, _input.length - 1);
          } else {
            // S’il ne restait qu’un chiffre, on repasse à 0
            _input = '0';
          }
          break;

        case '=':
        // Évalue l’expression seulement si elle est valide
        // Si l'utilisateur laisse un opérateur à la fin, on le retire
          if (_isOperator(_input[_input.length - 1])) {
            _input = _input.substring(0, _input.length - 1);
          }
          _output = evaluateExpression(_input);
          // On peut décider de stocker le résultat dans _input
          _input = _output;
          break;

        default:
        // Pour les autres boutons
          if (_input == '0' && value != '.' && value != '00' && !_isOperator(value)) {
            // Si l'input vaut "0" et qu'on tape un chiffre, on remplace directement
            _input = value;
          } else {
            _input += value;
          }
          break;
      }
    });
  }

  // Vérifier si un caractère est un opérateur : +, -, *, /, %
  bool _isOperator(String x) {
    return (x == '+' || x == '-' || x == '*' || x == '/' || x == '%');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculatrice Flutter')),
      body: Column(
        children: [
          // Affichage de l'entrée en haut
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                _input,
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Affichage du dernier résultat
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(20),
              child: Text(
                _output,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),
          ),
          // Grille des boutons
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: _buttons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,       // 4 boutons par rangée
                mainAxisSpacing: 10.0,   // Espacement vertical
                crossAxisSpacing: 10.0,  // Espacement horizontal
              ),
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index) {
                return ElevatedButton(
                  style: buttonStyle(_buttons[index]),
                  onPressed: () => _buttonPressed(_buttons[index]),
                  child: Text(_buttons[index], style: TextStyle(fontSize: 24)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
