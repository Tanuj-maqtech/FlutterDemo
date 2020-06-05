
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'contactlist.dart';
import 'package:flutterdemo/server/services.dart';
import 'package:flutterdemo/model/album.dart';
import 'package:flutterdemo/model/personModel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController passwordController = TextEditingController();
  AssetImage _assetsImage;
  File imageFile;
  Future<Person> _futureAlbum;
  var _opacity = 1.0;
  var _xOffset = 0.0;
  var _yOffset = 0.0;
  var _blurRadius = 0.0;
  var _spreadRadius = 0.0;

  Future<void> showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Your Choice"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Take Snap shot"),
                    onTap: () {
                      _openCamera(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: Text("open Gallery"),
                    onTap: () {
                      _openGallery(context);
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Profile page"),
          backgroundColor: Colors.black,
        ),
        body: new Container(
          color: Colors.black,
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          //margin: const EdgeInsets.only(left: 10.0,right: 10.0),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.

            child: new Container(
              width: 340,
              height: 500,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Container(
                    width: 100,
                    height: 100,
                      margin: const EdgeInsets.only(top: 10.0),

                    child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50,

                          backgroundImage: _selectedAssetImage().image,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child:  Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              ),
                            child: InkWell(
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              onTap: () {
                                showChoiceDialog(context);
                              },
                            ),

                          ),
                        )
                      ],
                    )
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        style: style,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText:"User Name",
                                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        style: style,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Email ID",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        style: style,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Mobile Number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextField(
                        style: style,
                        maxLines: 3,
                        minLines: 2,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Address",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0))),
                      )),
                  Container(
                      height: 50,
                      width: 400,
                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: RaisedButton(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.blue,
                        child: Text('Create Profile'),
                        onPressed: () {
                          Map data = {
                            'name': "Tanuj",
                            'job':"Android Developer",

                          };
                        /*  Person person = Person("","Tanuj", 30,"Android Developer");
                          Map<String, dynamic> map = person.toJson();*/

                          Services.createAlbum(data).then((_futureAlbum) {
                            if (_futureAlbum!=null) {
                              showDialog(
                                builder: (context) => AlertDialog(
                                  title: Text(_futureAlbum.name+' Employee has been added!!!'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);

                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                ),
                                context: context,
                              );
                              return;
                            }else{
                              showDialog(
                                builder: (context) => AlertDialog(
                                  title: Text('Error Adding Employee!!!'),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('OK'),
                                    )
                                  ],
                                ),
                                context: context,
                              );
                              return;
                            }
                          });

                        },
                      )),
                ],
              ),
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
    ;
  }

  _openGallery(BuildContext context) async {
    var selectPicture =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      if(selectPicture!=null){
        imageFile = selectPicture;
      }

    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var selectPicture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      if(selectPicture!=null){
        imageFile = selectPicture;
      }

    });
    Navigator.of(context).pop();
  }

  Widget _decidedImage() {
    if (imageFile == null) {
      return Text("Not Selected any Image");
    } else {
      return Image.file(imageFile, width: 300, height: 200);
    }
  }

  Image _selectedAssetImage()  {

    if (imageFile == null)  {
      return new Image(image:AssetImage('images/friendsimage.jpg'));
    } else {
      return new Image(image:FileImage(imageFile));;
      ;
    }
  }
  Widget _argString(ScreenArguments args){
    if (args!=null){
      return Text(args.title);
    }else{
      return Text('');
    }
  }
}

class assetImage extends StatelessWidget {
  String path = "";

  logoAssetImage(String Path) {
    this.path = path;
  }

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage(path);
    Image image = Image(image: assetImage);
    // TODO: implement build
    return image;
  }

}
