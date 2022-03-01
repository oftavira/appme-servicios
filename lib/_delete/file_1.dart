import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
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
// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  bool enabled = true;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          enabled = !enabled;
          setState(() {});
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                print("First text field: $text");
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              enabled: enabled,
              decoration: InputDecoration(
                //[x] focusedBorder
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                    color: Colors.blue,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                icon: Icon(Icons.vpn_key_rounded),
                //[x] disabledBorder
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                    color: Colors.green,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                //[x] enabledBorder
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                    color: Colors.pink,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                // [x] border
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
                    color: Colors.amber,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                labelText: 'Password',
              ),
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}
