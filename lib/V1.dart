import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum CategoryMarker { cat1, cat2, cat3, cat4 }
var total = 0.0;

void main() => runApp(MaterialApp(

    home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('My First Store!')),
        ),
        body: AppBody())));

class AppBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppBodyState();
}

class AppBodyState extends State<AppBody> {
  CategoryMarker SelectedCategory = CategoryMarker.cat1;

  Widget getCategory() {
    switch (SelectedCategory) {
      case CategoryMarker.cat1:
        return Category1List();
      case CategoryMarker.cat2:
        return Category2List();
      case CategoryMarker.cat3:
        return Category3List();
      case CategoryMarker.cat4:
        return Category4List();
    }
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(
          flex: 1,
          child: Row(children: [
            Expanded(
              child: Container(
                  height: 50.0,
                  margin: const EdgeInsets.all(0.0),
                  padding: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(1.0),
                              padding: const EdgeInsets.all(1.0),
                              child: ElevatedButton(
                                  child: Text('cat 1'),
                                  onPressed: () {
                                    setState(() {
                                      SelectedCategory = CategoryMarker.cat1;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  )))),
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(1.0),
                              padding: const EdgeInsets.all(1.0),
                              child: ElevatedButton(
                                  child: Text('cat 2'),
                                  onPressed: () {
                                    setState(() {
                                      SelectedCategory = CategoryMarker.cat2;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  )))),
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(1.0),
                              padding: const EdgeInsets.all(1.0),
                              child: ElevatedButton(
                                  child: Text('cat 3'),
                                  onPressed: () {
                                    setState(() {
                                      SelectedCategory = CategoryMarker.cat3;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  )))),
                      Expanded(
                          child: Container(
                              margin: const EdgeInsets.all(1.0),
                              padding: const EdgeInsets.all(1.0),
                              child: ElevatedButton(
                                  child: Text('cat 4'),
                                  onPressed: () {
                                    setState(() {
                                      SelectedCategory = CategoryMarker.cat4;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                  ))))
                    ],
                  )),
            )
          ])),
      Expanded(flex: 8, child: getCategory()),
      Expanded(
          flex: 0,
          child: RaisedButton(
            onPressed: () {},
            child: const Text('Check Out!', style: TextStyle(fontSize: 20)),
            color: Colors.blue,
            textColor: Colors.white,
            elevation: 5,
          ))
    ]));
  }
}

class Category1List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600.0,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Text('Item pic11'),
                title: Text('Item Description'),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Alert Dialog"),
                              content: TextField(inputFormatters: [FilteringTextInputFormatter.digitsOnly], keyboardType: TextInputType.number,),
                            actions: [FlatButton(onPressed: (){}, child: Text('Confirm?'))],
                            );
                          });
                    },
                    icon: Icon(Icons.add_rounded)),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Item pic12'),
                title: Text('Item Description'),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.add_rounded)),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Item pic13'),
                title: Text('Item Description'),
                trailing:
                    IconButton(onPressed: () {}, icon: Icon(Icons.add_rounded)),
              ),
            ),
          ],
        ));
  }
}

class Category2List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600.0,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Text('Item pic2'),
                title: Text('Item Description'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Item pic2'),
                title: Text('Item Description'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Item pic2'),
                title: Text('Item Description'),
              ),
            ),
          ],
        ));
  }
}

class Category3List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600.0,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Text('Item pic3'),
                title: Text('Item Description'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Item pic3'),
                title: Text('Item Description'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Item pic3'),
                title: Text('Item Description'),
              ),
            ),
          ],
        ));
  }
}

class Category4List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600.0,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Text('Item pic4'),
                title: Text('Item Description'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Item pic4'),
                title: Text('Item Description'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Text('Item pic4'),
                title: Text('Item Description'),
              ),
            ),
          ],
        ));
  }
}
