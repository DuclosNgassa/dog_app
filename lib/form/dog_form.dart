import 'package:flutter/material.dart';
import '../component/custom_linear_gradient.dart';
import '../model/dog_model.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  // One TextEditingController for each form input:
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void submitPup(context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Pups neeed names!'),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else{
      var newDog = Dog(nameController.text, locationController.text, descriptionController.text);
      Navigator.of(context).pop(newDog);
    }
  }

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
                padding: const EdgeInsets.only(
                    top: 20.0, right: 30.0, bottom: 8.0, left: 30.0),
                child: TextField(
                  // Tell your textfield which controller it owns
                  controller: nameController,
                  // Every single time the text changes in a
                  // TextField, this onChanged callback is called
                  // and it passes in the value.
                  //
                  // Set the text of your controller to
                  // to the next value.
                  onChanged: (v) => nameController.text = v,
                  decoration: InputDecoration(
                    labelText: 'Name the Pup',
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 30.0, bottom: 8.0, left: 30.0),
                child: TextField(
                  controller: locationController,
                  onChanged: (v) => locationController.text = v,
                  decoration: InputDecoration(
                    labelText: "Pup's location",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 30.0, bottom: 8.0, left: 30.0),
                child: TextField(
                  controller: descriptionController,
                  onChanged: (v) => descriptionController.text = v,
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
                      onPressed: () => submitPup(context),
                      color: Colors.deepPurple,
                      child: Text(
                        'Submit Pup',
                        style: TextStyle(color: Colors.white),
                      ),
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
