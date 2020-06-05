import 'package:flutter/material.dart';
import 'package:flutterdemo/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = new TextEditingController();

  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

       /* appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Log In "),
        ),*/
        body: new Container(
          color: Colors.deepOrange,
          //margin: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.

            child: new SingleChildScrollView(
             child: new Container(
                width: 340,
                height: 400,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 150,
                      padding: EdgeInsets.fromLTRB(2, 0, 2, 2),
                      child: logoAssetImage(),
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child:TextField(
                          style: style,
                          controller: emailController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)
                              )
                          ),
                        )
                    ),
                    Container(

                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child:TextField(
                          obscureText: true,
                          controller: passwordController,
                          style: style,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0)
                              )
                          ),
                        )),
                    Container(
                        height: 50,
                        width: 400,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)),
                          color: Colors.blue,
                          child: Text('Login'),
                          onPressed: () {

                            if(emailController.text!=null && !emailController.text.toString().isEmpty){
                              addStringToSF("userName",emailController.text);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                    settings: RouteSettings(name: '/homepage')),
                              );
                            }else{
                              Fluttertoast.showToast(
                                  msg: "Please Enter User Name or Email ID",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              return ;
                            }


                          },
                        )),

                    FlatButton(
                      onPressed: (){
                        //forgot password screen
                      },
                      textColor: Colors.blue,
                      child: Text('Forgot Password'),
                    ),
                    Container(
                        child: Row(
                          children: <Widget>[
                            Text('Does not have account?'),
                            FlatButton(
                              textColor: Colors.blue,
                              child: Text(
                                'Sign in',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                //signup screen
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        )
                    )


                  ],
                ),
              ),
            )
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
    ;  }
  addStringToSF(String keyValue,String valueString) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(keyValue, valueString);
  }
}
class logoAssetImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
AssetImage assetImage= AssetImage('images/logo_marquistech.png');
Image image=Image(image: assetImage);
    // TODO: implement build
    return image;
  }

}