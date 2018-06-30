import 'package:flutter/material.dart';
import 'package:ob_explorers/utils/nav.dart';
import 'package:ob_explorers/utils/ob.dart';

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
    List<String> ci = <String>[];
    List<String> ce = <String>[];
    List<String> bc = <String>[];
    List<String> bo = <String>[];
    ci = data.data["Includes"].split("\\n");
    ce = data.data["Excludes"].split("\\n");
    li = data.data["Itinerary"].split("\\n");
    bc = data.data["Belongings"]["Compulsory"].split("\\n");
    bo = data.data["Belongings"]["Optional"].split("\\n");
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
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: li.length,
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      leading: Icon(Icons.arrow_downward),
                      title: Text(
                        li[index].trim(),
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Cost",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "₹" + data.data["Cost"].toString() + " /-",
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Cost Includes",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: ci.length,
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      leading: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                      title: Text(
                        ci[index].trim(),
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Cost Excludes",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: ce.length,
              padding: EdgeInsets.zero,
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      title: Text(
                        ce[index].trim(),
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Compulsory Belongings",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: bc.length,
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.work),
                      title: Text(
                        bc[index].trim(),
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Text(
              "Optional Belongings",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: bo.length,
              itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 0.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.spa),
                      title: Text(
                        bo[index].trim(),
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: FlatButton(
                  child: const Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.grey,
                    ),

                  ),
                  onPressed: () {MyNavigator.goToContact(context);},
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: MaterialButton(
                  color: Colors.blue,
                  elevation: 3.0,
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    if(DateTime.now().compareTo(data.data['SDate'])>0){
                      return null;
                    }
                    else{
                      U.data = data;
                      MyNavigator.goToReg(context, data);
                    }
                  },
                ),
              ),
            ],
          )
          /*
          static,
          */
        ],
      ),
    );
  }
}
