/*FUTURE 
Used to represent a value that will b e available at some time in the future
used for asychronous programming such  a fetching data from the API,accessing the db,or waiting for any other asynchronous operation to complete
In handling future results,you can use
then()-called when the future compeletes succesfully
catchError()-used to handle errors
await()-used in combination with asyc to make code easier to read and write

FutureBuilder widget takes a future and builder func that defines what to display while waiting for the results and what to display once the results is available

1.Future<String> fetchData() async {
  // Simulate a network request or a time-consuming operation
  await Future.delayed(Duration(seconds: 2));
  return "Data loaded!";
}

void main() {
  fetchData().then((data) {
    print(data); // This will print "Data loaded!" after 2 seconds
  });
}

2.Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return "Data loaded!";
}

void main() async {
  String data = await fetchData();
  print(data); // This will print "Data loaded!" after 2 seconds
}

3.import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FutureBuilder Example')),
        body: Center(
          child: FutureBuilder<String>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text('Result: ${snapshot.data}');
              }
            },
          ),
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return "Data from Future";
  }
}

Common Use Cases for Futures in Flutter:
Fetching data from an API
Reading/writing to files or databases
Handling delays, timers, or animations
Running computationally expensive tasks


COLUMN
Places the widget in a vetical layout

Shrinkwrap sizes the listview based on its children height

*/



