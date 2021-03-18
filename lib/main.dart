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
                  "la PGCD est " + diviseur().toString(),
                ),
              );
            },
          );
        },
        tooltip: 'appuyez pour obtenir le PGCD !',
        child: Icon(Icons.calculate),
      ),
    );
  }

  diviseur() {
    var s1 = 0;
    var s2 = 0;

    try {
      s1 = int.parse(valeur.text);
      s2 = int.parse(valeur2.text);
      while (s1 != s2) {
        if (s1 > s2)
          s1 = s1 - s2;
        else
          s2 = s2 - s1;
      }
      return s1;
    } catch (exp) {
      return "il faut donner des entier";
    }
  }
}
