import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController passwordController = TextEditingController();
  String userName;

  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;

  @override
  Widget build(BuildContext context) {

    getStringValuesSF("userName");
    return Scaffold(

       /* appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          //title:new Center(child: new Text("Home", textAlign: TextAlign.center)),
          title: Text("Home"),
          backgroundColor: Colors.black,
        ),*/
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: new Text(
                  "Neavigation Drawer",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: new Container(
            color: Colors.black,
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //margin: const EdgeInsets.only(left: 10.0,right: 10.0),

            child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
            SliverAppBar(
              title: Text("Welcome to "+userName),
              backgroundColor: Colors.black,
            ),
                SliverPadding(

                  padding: const EdgeInsets.all(20),

                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,


                    children: <Widget>[
                      GestureDetector(
                        child: Container(
                      padding: const EdgeInsets.all(8),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 100,

                        padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                        child: logoAssetImage("profle.png"),

                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                        child: FlatButton(
                          textColor: Colors.blue,
                          child: Text(
                            'Profile',
                            style: TextStyle(
                                fontSize: 14, color: Colors.white),
                          ),
                          onPressed: () {

                            //signup screen
                          },
                        ),
                      ),
                    ],
                  ),
                  color: Color(0xFF303030),
                ),
                        onTap: () {
                          Navigator.pushNamed(context, '/profilepage');
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 80,
                                width: 100,
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                                child: logoAssetImage("profle.png"),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                                child: FlatButton(
                                  textColor: Colors.blue,
                                  child: Text(
                                    'Contact List',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {

                                    //signup screen
                                  },
                                ),
                              ),
                            ],
                          ),
                          color: Color(0xFF303030),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/contactlist');
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 80,
                                width: 100,
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                                child: logoAssetImage("profle.png"),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                                child: FlatButton(
                                  textColor: Colors.blue,
                                  child: Text(
                                    'Order List',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {

                                    //signup screen
                                  },
                                ),
                              ),
                            ],
                          ),
                          color: Color(0xFF303030),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/orderlist');
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 80,
                                width: 100,
                                padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                                child: logoAssetImage("profle.png"),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                                child: FlatButton(
                                  textColor: Colors.blue,
                                  child: Text(
                                    'Bottom Navigation bar',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {

                                    //signup screen
                                  },
                                ),
                              ),
                            ],
                          ),
                          color: Color(0xFF303030),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/orderlist');
                        },
                      ),

                    ],
                  ),
                ),
              ],
            ))
        // This trailing comma makes auto-formatting nicer for build methods.
        );
    ;
  }
  Future<String> getStringValuesSF(String keyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool CheckValue = prefs.containsKey(keyName);


    //Return bool
    String stringValue = "";
    if(CheckValue){
      stringValue = prefs.getString(keyName);
      setState(() {
        userName = stringValue;
      });
    }else{
      Fluttertoast.showToast(
          msg: "Nothing To Save ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    return stringValue;
  }
}

class shadowBox extends StatelessWidget {
  @override
  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;

  Widget build(BuildContext context) {
    Container child = new Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, _opacity),
            offset: Offset(_xOffset, _yOffset),
            blurRadius: _blurRadius,
            spreadRadius: _spreadRadius,
          )
        ],
      ),
    );

    return child;
  }

}

class logoAssetImage extends StatelessWidget {
  var uriimage = '';

  logoAssetImage(var uri_image) {
    this.uriimage = uri_image;
  }

  @override
  Widget build(BuildContext context)  {
    AssetImage assetImage = AssetImage("images/" + uriimage);
    Image image = Image(image: assetImage);
    // TODO: implement build
    return image;
  }
}
