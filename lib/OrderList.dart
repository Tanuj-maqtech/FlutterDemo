import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrderListPage extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderListPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Order  List"),
        backgroundColor: Colors.black,
      ),
      body: BodyLayout(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
    ;
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  return new DefaultTabController(
    length: 3,
    child: new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[],
        title: new TabBar(

          tabs: [
            new Tab(icon: new Icon(Icons.directions_car)),
            new Tab(icon: new Icon(Icons.directions_transit)),
            new Tab(icon: new Icon(Icons.directions_bike)),
          ],
          indicatorColor: Colors.white,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: new TabBarView(
        children: [
          new Icon(Icons.directions_car,size: 50.0,),
          new Icon(Icons.directions_transit,size: 50.0,),
          new Icon(Icons.directions_bike,size: 50.0,),
        ],
      ),
    ),
  );

}

Widget _myListViewCardlayout(BuildContext context) {
  final titles = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk'
  ];

  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_railway,
    Icons.directions_run,
    Icons.directions_subway,
    Icons.directions_transit,
    Icons.directions_walk
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      return Card(
        //                           <-- Card widget
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/friendsimage.jpg'),
          ),
          title: Text(titles[index]),
          subtitle: Text(titles[index]),
        ),
      );
    },
  );
}

Widget _myListViewCustomLayout(BuildContext context) {
  final titles = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk'
  ];

  final icons = [
    Icons.directions_bike,
    Icons.directions_boat,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.directions_railway,
    Icons.directions_run,
    Icons.directions_subway,
    Icons.directions_transit,
    Icons.directions_walk
  ];

  return ListView.builder(
    itemCount: titles.length,
    itemBuilder: (context, index) {
      var post = titles[index];
      return GestureDetector(
        child: Card(
          color: Colors.black,
          //                           <-- Card widget
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: new Row(
                children: <Widget>[
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  /*    image: new NetworkImage(
                                      "https://i.imgur.com/BoN9kdC.png")*/
                                  image:new AssetImage('images/friendsimage.jpg'),

                                ))
                        ),

                      ]
                  ),
                  new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new Container(
                            padding: EdgeInsets.fromLTRB(15, 2, 10, 2),
                            child:new Column(

                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                                    child:    new Text(titles[index],
                                      style: TextStyle(fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                                    child:  new Text("John Doe",
                                      style: TextStyle(fontSize: 12, color: Colors.green),
                                    )
                                    ,
                                  )
                                ]

                            )
                        )

                      ]
                  ),


                ]),
          ),
        ),
        onTap: () {
          Fluttertoast.showToast(
              msg: titles[index],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.pushNamed(context, '/profilepage',arguments:ScreenArguments(
            titles[index],
            index,
          ),
          );
        },
      );

    },
  );

}
class ScreenArguments {
  final String title;
  final int pos;

  ScreenArguments(this.title, this.pos);
}
