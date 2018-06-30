import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ob_explorers/utils/nav.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Places To Visit"),
      ),
      body: new StreamBuilder(
          stream: Firestore.instance
              .collection("Locations")
              .orderBy("Distance")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return new Container(
                color: Colors.green[200],
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/Fort.png",
                          width: 200.0,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text("Loading...."),
                        ),
                        CircularProgressIndicator(),
                      ]),
                ),
              );
            return new ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: snapshot.data.documents.length,
                padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.documents[index];
                  return MyNotification(d: ds);
                });
          }),
    );
  }
}

class MyNotification extends StatelessWidget {
  final d;
  const MyNotification({Key key, this.d}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FlatButton(
              child: Container(
                height: 150.0,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      d.data["Image"],
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              padding: EdgeInsets.all(0.0),
              onPressed: () => MyNavigator.showLoc(context, d),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                title: Text(
                  d.data["Name"].toString().toUpperCase(),
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                onTap: () => MyNavigator.showLoc(context, d)),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  Row(

                    children: <Widget>[
                      Text(d.data["Height"].toString() + 'm'),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Text(d.data["Time"]),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(d.data["Distance"].toString() + 'KM'),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                      ),
                      Text(d.data["Season"]),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Loc extends StatelessWidget {
  final d;
  const Loc({Key key, this.d}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(d.data["Name"]),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 220.0,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    d.data["Image"],
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    d.data["Name"],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
          Divider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "About Location",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              d.data["About"],
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Information",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.check)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Base Village",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.arrow_forward)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            d.data["Base"],
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.check)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Level(0-5)",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.arrow_forward)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            d.data["Level"].toString(),
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.check)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Duration",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.arrow_forward)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            d.data["Time"].toString(),
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.check)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Best Season",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.arrow_forward)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            d.data["Season"],
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.check)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Distance",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.arrow_forward)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            d.data["Distance"].toString() + ' KM',
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.check)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Height",
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[Icon(Icons.arrow_forward)],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            d.data["Height"].toString() + 'Meter',
                            style: TextStyle(fontSize: 16.0),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.0),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Nearby places",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              d.data["Places"],
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "History",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              d.data["History"],
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
