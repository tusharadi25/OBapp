import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  final data;
  const InfoScreen({Key key, this.data}) : super(key: key);

  String findMonth(DateTime d) {
    int dout = d.month;
    switch (dout) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "Aug";
      case 9:
        return "Sept";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
      default:
        return "Error";
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> li = <String>[];
    int n = '\\n'.allMatches(data.data["Itinerary"]).length;
    li = data.data["Itinerary"].split("\\n");
    String start = li[0];
    li.removeAt(0);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.data["Name"],
        ),
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
                    data.data["Image"],
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
                    data.data["Name"],
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
              "About the trip",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              data.data["About"],
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Batch Dates",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Outing Date : " +
                  data.data["EDate"].day.toString() +
                  " " +
                  findMonth(data.data["EDate"]) +
                  " " +
                  data.data["EDate"].year.toString(),
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Short Information",
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
                            "Category",
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
                            data.data["Information"]["Category"],
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
                            "Level",
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
                            data.data["Information"]["Level"],
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
                            data.data["Information"]["Duration"],
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
                            "Transport",
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
                            data.data["Information"]["ModeOfTrans"],
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
                            data.data["Information"]["Distance"],
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
              "Itinerary",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              start,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.justify,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: li.length,
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      leading: Icon(Icons.add),
                      title: Text(
                        li[index].trim(),
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )),
          /*
          iternary,
          trekcost,
          static,
          '''
          */
        ],
      ),
    );
  }
}
