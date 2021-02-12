import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum CategoryMarker { cat1, cat2, cat3, cat4 }

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.orangeAccent,
          accentColor: Colors.lightGreenAccent,
          fontFamily: 'sans-serif',
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          )),
      home: myApp(),
    );
  }
}

class myApp extends StatefulWidget {
  myApp({Key key}) : super(key: key);

  @override
  createState() {
    return AppStateManager();
  }
}

class AppStateManager extends State<myApp> {
  double currentTotal = 0.0;

  //final List<String> inventoryName = <String>['test', 'test', 'test'];
  //final List<double> inventoryPrice = <double>[2, 0, 10];
  //final List<double> inventoryQuantity = <double>[2, 0, 10];
  final List<String> inventoryName = <String>[];
  final List<double> inventoryPrice = <double>[];
  final List<double> inventoryQuantity = <double>[];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  double totalAdd = 1.0;

  CategoryMarker SelectedCategory = CategoryMarker.cat1;

  Widget getCategory() {
    switch (SelectedCategory) {
      case CategoryMarker.cat1:
        return getCategory1(addFunction: addTotal);
      case CategoryMarker.cat2:
        return getCategory2(addFunction: addTotal);
      case CategoryMarker.cat3:
        return getCategory3(addFunction: addTotal);
      case CategoryMarker.cat4:
        return getCategory4(addFunction: addTotal);
    }
  }

  addTotal(name, price, quantity) {
    setState(() {
      inventoryName.insert(0, name);
      inventoryQuantity.insert(0, quantity);
      inventoryPrice.insert(0, price);
      currentTotal = currentTotal + (price * quantity);
    });
    print("added $inventoryPrice");
  }

  clearInventory() {
    setState(() {
      inventoryName.clear();
      inventoryPrice.clear();
      inventoryQuantity.clear();
      currentTotal = 0.0;
    });
  }

  Widget build(BuildContext context) {
    void _showExitDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog

          return AlertDialog(
              title: Text("Successful Purchase, Chart Cleared!"));
        },
      );
    }

    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          print(inventoryName.length);
          return AlertDialog(
            title: Text("Total Due: Rwf $currentTotal"),
            content: Container(
                height: 300.0,
                width: 300.0,
                child: ListView.builder(
                    padding: const EdgeInsets.all(2.0),
                    itemCount: inventoryName.length,
                    itemBuilder: (context, index) {
                      return Container(
                          child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Center(
                                  child: Text('${inventoryQuantity[index]}'))),
                          Expanded(
                              flex: 1, child: Text("${inventoryName[index]}")),
                          Expanded(
                              flex: 1,
                              child: Center(
                                  child: Text(
                                      "RWF: ${inventoryPrice[index] * inventoryQuantity[index]}")))
                        ],
                      ));
                    })),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Buy Items?"),
                onPressed: () {
                  clearInventory();
                  Navigator.of(context).pop();
                  _showExitDialog();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.orange,
            child: Icon(Icons.shopping_basket),
            onPressed: () {
              _showDialog();
              //getChart(
              // inventoryNames: inventoryName, inventoryPrices: inventoryPrice);
            }),
        appBar: AppBar(
            title: Center(
                child: Text(
          "Traveling Oranges",
        ))),
        body: Column(children: [
          Container(
              padding: EdgeInsets.only(top: 1.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Container(
                        height: 50.0,
                        margin: EdgeInsets.only(left: 1.0),
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.deepOrange),
                            highlightedBorderColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                SelectedCategory = CategoryMarker.cat1;
                              });
                            },
                            child: Text('Fruits')))),
                Expanded(
                    child: Container(
                        height: 50.0,
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.deepOrange),
                            highlightedBorderColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                SelectedCategory = CategoryMarker.cat2;
                              });
                            },
                            child: Text('Veg')))),
                Expanded(
                    child: Container(
                        height: 50.0,
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.deepOrange),
                            highlightedBorderColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                SelectedCategory = CategoryMarker.cat3;
                              });
                            },
                            child: Text('Meat')))),
                Expanded(
                    child: Container(
                        height: 50.0,
                        margin: EdgeInsets.only(right: 1.0),
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.deepOrange),
                            highlightedBorderColor: Colors.grey,
                            onPressed: () {
                              setState(() {
                                SelectedCategory = CategoryMarker.cat4;
                              });
                            },
                            child: Text('Drinks')))),
              ])),
          Expanded(flex: 8, child: getCategory()),
          Expanded(
              flex: 1,
              child: Center(child: Text("Current Total: $currentTotal")))
        ]));
  }
}

class getCategory1 extends StatelessWidget {
  final addFunction;
  final myNumberController = TextEditingController();
  final assetPath = [
    'assets/greenApple.jpg',
    'assets/redApple.jpg',
    'assets/greenGrapes.jpg',
    'assets/redGrapes.jpg',
    'assets/banana.jpg',
    'assets/greenApple.jpg',
    'assets/redApple.jpg',
    'assets/greenGrapes.jpg',
    'assets/redGrapes.jpg',
    'assets/banana.jpg',
    'assets/greenApple.jpg',
    'assets/redApple.jpg',
    'assets/greenGrapes.jpg',
    'assets/redGrapes.jpg',
    'assets/banana.jpg'
  ];
  final itemName = [
    'Small Green Apple',
    'Small Red Apple',
    'Small Green Grape',
    'Small Red Grape',
    'Small Banana',
    'Mid Green Apple',
    'Mid Red Apple',
    'Mid Green Grape',
    'Mid Red Grape',
    'Mid Banana',
    'Large Green Apple',
    'Large Red Apple',
    'Large Green Grape',
    'Large Red Grape',
    'Large Banana',
  ];
  final itemPrice = [
    2.0,
    1.7,
    15.0,
    20.0,
    1.0,
    4.0,
    4.7,
    20.0,
    25.0,
    2.0,
    6.0,
    6.7,
    25.0,
    35.0,
    4.0
  ];

  getCategory1({this.addFunction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: itemName.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image(
                  image: AssetImage(assetPath[index]),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill),
              title: Center(child: Text(itemName[index])),
              subtitle: Center(child: Text("RWF: ${itemPrice[index]}")),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                                child: Text(
                                    "Please select quantity of ${itemName[index]} you want, at RWF ${itemPrice[index]} each?")),
                            content: TextField(
                              controller: myNumberController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel!')),
                              FlatButton(
                                  onPressed: () {
                                    addFunction(
                                        itemName[index],
                                        itemPrice[index],
                                        double.parse(myNumberController.text));
                                    myNumberController.clear();

                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Confirm?'))
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add_rounded)),
            ),
          );
        });
  }
}

class getCategory2 extends StatelessWidget {
  final addFunction;
  final myNumberController = TextEditingController();
  final assetPath = [
    'assets/tomato.jpg',
    'assets/kale.jpg',
    'assets/spinach.jpg',
    'assets/eggPlant.jpg',
    'assets/potato.jpg',
    'assets/onion.jpg',
  ];
  final itemName = ['Tomato', 'Kale', 'Spinach', 'EggPlant', 'Potato', 'Onion'];
  final itemPrice = [
    25.0,
    2.0,
    6.0,
    6.7,
    25.0,
    35.0,
  ];

  getCategory2({this.addFunction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: itemName.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image(
                  image: AssetImage(assetPath[index]),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill),
              title: Center(child: Text(itemName[index])),
              subtitle: Center(child: Text("RWF: ${itemPrice[index]}")),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                                child: Text(
                                    "Please select quantity of ${itemName[index]} you want, at RWF ${itemPrice[index]} each?")),
                            content: TextField(
                              controller: myNumberController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel!')),
                              FlatButton(
                                  onPressed: () {
                                    addFunction(
                                        itemName[index],
                                        itemPrice[index],
                                        double.parse(myNumberController.text));
                                    myNumberController.clear();

                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Confirm?'))
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add_rounded)),
            ),
          );
        });
  }
}

class getCategory3 extends StatelessWidget {
  final addFunction;
  final myNumberController = TextEditingController();
  final assetPath = [
    'assets/fish.jpg',
    'assets/chicken.jpg',
    'assets/beef.jpg',
    'assets/fish.jpg',
    'assets/chicken.jpg',
    'assets/beef.jpg',
    'assets/fish.jpg',
    'assets/chicken.jpg',
    'assets/beef.jpg'
  ];
  final itemName = [
    '250g Fish',
    '250g Chicken',
    '250g Beef',
    '500g Fish',
    '500g Chicken',
    '500g Beef',
    '1k Fish',
    '1kg Chicken',
    '1kg Beef'
  ];
  final itemPrice = [
    2000.0,
    1500.0,
    1000.0,
    3500.0,
    2500.0,
    2000.0,
    5000.0,
    4500.0,
    4000.0,
  ];

  getCategory3({this.addFunction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: itemName.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image(
                  image: AssetImage(assetPath[index]),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill),
              title: Center(child: Text(itemName[index])),
              subtitle: Center(child: Text("RWF: ${itemPrice[index]}")),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                                child: Text(
                                    "Please select quantity of ${itemName[index]} you want, at RWF ${itemPrice[index]} each?")),
                            content: TextField(
                              controller: myNumberController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel!')),
                              FlatButton(
                                  onPressed: () {
                                    addFunction(
                                        itemName[index],
                                        itemPrice[index],
                                        double.parse(myNumberController.text));
                                    myNumberController.clear();

                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Confirm?'))
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add_rounded)),
            ),
          );
        });
  }
}

class getCategory4 extends StatelessWidget {
  final addFunction;
  final myNumberController = TextEditingController();
  final assetPath = [
    'assets/coke.jpg',
    'assets/sprite.jpg',
    'assets/water.jpg'
  ];
  final itemName = ['500ml Coke', '500ml Sprite', '500ml Water'];
  final itemPrice = [500.0, 550.0, 400.0];

  getCategory4({this.addFunction});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: itemName.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image(
                  image: AssetImage(assetPath[index]),
                  width: 50,
                  height: 50,
                  fit: BoxFit.fill),
              title: Center(child: Text(itemName[index])),
              subtitle: Center(child: Text("RWF: ${itemPrice[index]}")),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                                child: Text(
                                    "Please select quantity of ${itemName[index]} you want, at RWF ${itemPrice[index]} each?")),
                            content: TextField(
                              controller: myNumberController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                            ),
                            actions: [
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel!')),
                              FlatButton(
                                  onPressed: () {
                                    addFunction(
                                        itemName[index],
                                        itemPrice[index],
                                        double.parse(myNumberController.text));
                                    myNumberController.clear();

                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Confirm?'))
                            ],
                          );
                        });
                  },
                  icon: Icon(Icons.add_rounded)),
            ),
          );
        });
  }
}

class getInventory extends StatelessWidget {
  final inventoryNames;
  final inventoryPrices;

  getInventory({this.inventoryNames, this.inventoryPrices});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        padding: const EdgeInsets.all(2.0),
        itemCount: inventoryNames.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  leading: Text('Item pic $index'),
                  title: Center(child: Text(inventoryNames[index])),
                  subtitle:
                      Center(child: Text("RWF: ${inventoryPrices[index]}")),
                  trailing: Center(
                      child: Text("RWF: ${inventoryPrices[index] * 2}"))));
        });
  }
}
