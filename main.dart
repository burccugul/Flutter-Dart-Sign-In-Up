import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign in Sign Up',
      initialRoute: "/",
      routes: {
        "/": (context) => MyHomePage(),
        "/ProfilPage": (context) => Profil(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  open() {
    if(t1.text== "admin" && t2.text == "1234"){
      Navigator.pushNamed(context, "/ProfilPage", arguments: DataModel(name: t1.text, password: t2.text));
    }else{
      showDialog(
          context: context,
          builder: (BuildContext context){
        return AlertDialog(
          title: new Text("Wrong password or username"),
          content: new Text("Try Again"),
          actions: [
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              }
            ),
          ],
        );}
      );}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In Page'),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(80.0),
            child: Column(
              children: [
                TextFormField(controller: t1,decoration: InputDecoration(hintText: "User Name"),),
                TextFormField(controller: t2,decoration: InputDecoration(hintText: "Password"),),
                RaisedButton(
                  onPressed: open,
                  child: Text("Sign in"),
                )
              ],
            ),
          ),
        ));
  }
}

class Profil extends StatefulWidget {
  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  close() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    DataModel arguments = ModalRoute.of(context)!.settings.arguments as DataModel;
    return Scaffold(
      appBar: AppBar(title: Text('Sign Out Page')),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: close,
              child: Text("Sign Out"),
            ),
            Text(arguments.name),
            Text(arguments.password),
          ],
        ),
      ),
    );
  }
}

class DataModel{
  late String name;
  late String password;
  DataModel({required this.name,required this.password});
}
