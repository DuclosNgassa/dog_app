import 'package:flutter/material.dart';
import '../component/custom_linear_gradient.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  @override
  Widget build(BuildContext context) {
    // new page needs scaffording!
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: CustomLinearGradient(
        myChild: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Name the Pup',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Pup's location",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'All about the pup',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              // A Strange situation.
              // A piece of the app that you'll add in the next
              // section *needs* to know its context,
              // and the easiest way to pass a context is to
              // use a builder method. So I've wrapped
              // this button in a Builder as a sort of 'hack'.
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    //The basic Material Design action button.
                    return RaisedButton(
                      onPressed: () => print('PRESSED'),
                      color: Colors.deepPurple,
                      child: Text('Submit Pup'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
