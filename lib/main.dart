import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tester votre IMC',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final valeur = TextEditingController();
  final valeur2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    valeur.dispose();
    valeur2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcule de PGCD'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Column(children: <Widget>[
          TextField(
            controller: valeur,
            decoration: const InputDecoration(
              hintText: 'votre premier entier ici',
            ),
          ),
          TextField(
            controller: valeur2,
            decoration: const InputDecoration(
              hintText: 'votre 2éme entier ici',
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(
                  "la factoriel est " + facto().toString(),
                ),
              );
            },
          );
        },
        tooltip: 'appuyez pour obtenir le nombre des entier paire !',
        child: Icon(Icons.calculate),
      ),
    );
  }

  facto() {
    var s = 0;
    var f = 1;

    try {
      s = int.parse(valeur.text);
      for (int i = 2; i <= s; i++) {
        f = f * i;
      }
      return f;
    } catch (exp) {
      return "il faut donner des entier";
    }
  }
}
