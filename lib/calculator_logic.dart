import 'package:math_expressions/math_expressions.dart';

String evaluateExpression(String expression) {
  try {
    // Remplace éventuellement les symboles si besoin
    expression = expression.replaceAll('×', '*').replaceAll('÷', '/');

    // Pour gérer le pourcentage "simple" (ex: "50%" => 50*(1/100))
    // Si tu veux un vrai modulo, tu peux configurer autrement
    expression = expression.replaceAll('%', '*0.01');

    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    // Convertir 4.0 en "4"
    if (eval % 1 == 0) {
      return eval.toInt().toString();
    } else {
      return eval.toString();
    }
  } catch (e) {
    // En cas d'erreur (syntaxe, division par zéro, etc.)
    return "Erreur";
  }
}
