import 'package:flutter/material.dart';
import 'package:dog_app/model/dog_model.dart';
import 'package:dog_app/component/dog_card.dart';
import 'package:dog_app/component/dog_list.dart';
import './component/custom_linear_gradient.dart';
import './form/dog_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Dogs',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  int nextDogIndex = 0;

  void nextDog() {
    setState(() {
      nextDogIndex++;
      if (nextDogIndex == 5) {
        nextDogIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        backgroundColor: Colors.black87,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: CustomLinearGradient(
        myChild: Center(
          child: DogList(initialDoggos),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: nextDog,
        tooltip: 'Increment',
        child: Icon(Icons.account_balance),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return AddDogFormPage();
        },
      ),
    );

    if(newDog != null){
      initialDoggos.add(newDog);
    }
  }
}
