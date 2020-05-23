import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/controller.dart';
import 'package:flutterapp/models/feedbackform.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tusk Submit Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Tusk Submit Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // TextField Controllers
  TextEditingController entryIDController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController projectController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController componentGroupController = TextEditingController();
  TextEditingController componentController = TextEditingController();
  TextEditingController conditionController = TextEditingController();
  TextEditingController defectController = TextEditingController();
  TextEditingController actionController = TextEditingController();
  TextEditingController photo1Controller = TextEditingController();
  TextEditingController photo2Controller = TextEditingController();
  TextEditingController photo3Controller = TextEditingController();
  TextEditingController photo4Controller = TextEditingController();

  void _submitForm(){
    //if(_formKey.currentState.validate()) {
      if (true){
      FeedbackForm feedbackForm = FeedbackForm(
          entryIDController.text,
          userController.text,
          projectController.text,
          roomController.text,
          componentGroupController.text,
          componentController.text,
          conditionController.text,
          defectController.text,
          actionController.text,
          photo1Controller.text,
          photo2Controller.text,
          photo3Controller.text,
          photo4Controller.text
      );
      FormController formController = FormController(
        (String response) {
          print("Response: $response");
          if (response == FormController.STATUS_SUCCESS) {
            _showSnackBar("Data submitted SUCCESSFULLY to sheets");
          } else {
            _showSnackBar("Data submission FAILED");
          }
        }
      );
      _showSnackBar("Submitting " + feedbackForm.toParams());
      print(feedbackForm.toParams());
      formController.submitForm(feedbackForm);
    }
  }

  _showSnackBar(String  message) {
    final snackbar = SnackBar(content: Text(message),);
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
              padding: new EdgeInsets.all(12.0),
              child: new Center(
                    child: new Column(
                        key: _formKey,
                        children: <Widget>[
                            new Row(children: <Widget>[
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'EntryID'),validator: (value) {return null;},controller: entryIDController,),),
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'User'),validator: (value) {return null;},controller: userController,),),
                              ]),
                            new Row(children: <Widget>[
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Project'),validator: (value) {return null;},controller:projectController,),),
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Room'),validator: (value) {return null;},controller:roomController,),),
                            ]),
                            new Row(children: <Widget>[
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'ComponentGroup'),validator: (value) {return null;},controller:componentGroupController,),),
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Component'),validator: (value) {return null;},controller:componentController,),),
                            ]),
                            new Row(children: <Widget>[
                                 Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Condition'),validator: (value) {return null;},controller:conditionController,),),
                                 Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Defect'),validator: (value) {return null;},controller:defectController,),),
                            ]),
                            new Row(children: <Widget>[
                                    Expanded(child: TextFormField(decoration: InputDecoration(hintText: 'Action'),validator: (value) {return null;},controller:actionController,),),
                            ]),
                             new Row(children: <Widget>[
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Photo1'),validator: (value) {return null;},controller:photo1Controller,),),
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Photo2'),validator: (value) {return null;},controller:photo2Controller,),),
                            ]),
                            new Row(children: <Widget>[
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Photo3'),validator: (value) {return null;},controller:photo3Controller,),),
                                    Expanded(child:TextFormField(decoration: InputDecoration(hintText: 'Photo4'),validator: (value) {return null;},controller:photo4Controller,),),
                            ]),
                              RaisedButton(
                                    onPressed:(){_submitForm();},
                                    child: Text("Submit")
                                ),
                        ],
                    )
                )
            )
        );
  }
}

// THIS IS DROPDOWN MENU CODE FOR LATER
//import 'package:flutter/material.dart';
//
//void main() {
//  runApp(new MaterialApp(
//    home: new MyApp(),
//  ));
//}
//
//class MyApp extends StatefulWidget {
//  @override
//  _State createState() => new _State();
//}
//
//class _State extends State<MyApp> {
//  TextEditingController _user = new TextEditingController();
//  TextEditingController _pass = new TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('Name here'),
//      ),
//      body: new Container(
//          padding: new EdgeInsets.all(32.0),
//          child: new Center(
//            child: new Column(
//              children: <Widget>[
//                new Text('Please Login'),
//                new Row(
//                  children: <Widget>[
//                    new Text('Username: '),
//                    new Expanded(child: new TextField(controller: _user,))
//                  ],
//                ),
//                new Row(
//                  children: <Widget>[
//                    new Text('Password: '),
//                    new Expanded(child: new TextField(controller: _pass,obscureText: true,))
//                  ],
//                ),
//
//                new Padding(
//                  padding: new EdgeInsets.all(32.0),
//                  child: new RaisedButton(onPressed: () => print('Login ${_user.text}'), child: new Text('Click me'),),
//                )
//              ],
//            ),
//          )
//      ),
//    );
//  }
//}