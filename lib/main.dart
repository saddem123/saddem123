import 'package:contact_app/favorite_contact.dart';
import 'package:flutter/material.dart';

void main() => runApp(ContactApp());

class ContactApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactAppPage(),
    );
  }
}

class ContactAppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactAppPageState();

}

class _ContactAppPageState extends State<ContactAppPage> {
  List<String> _contacts = [
    "Ousema",
    "Bassem",
    "Aya",
    "Doniez",
    "Hedi",
    "Aziz",
    "Wassel",
    "Amal",
    "Mariem",
    "Helmi",
    "Wiem",
    "Amira",
    "Hamdi",
    "Yassin"
  ];
  List<String> _saved = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Contact App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavoriteContact(saved: _saved,),
              ));
            },
          )
        ],
      ),
      body: _buildContacts(),
    );
  }

  Widget _buildContacts() {
    List<Widget> _contactsWidgets = [];
    _contacts.forEach((String name){
      _contactsWidgets.add(_buildContact(name));
      _contactsWidgets.add(Divider());
    });
    return ListView(
      children: _contactsWidgets,
    );
  }

  Widget _buildContact(String name){
    var alreadySaved = _saved.contains(name);
    return GestureDetector(
      onTap: () {
        setState(() {
          if(alreadySaved){
            _saved.remove(name);
          }else {
            _saved.add(name);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.all(22),
        child: Row(
          children: <Widget>[
            Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey
              ),
              textAlign: TextAlign.start,
            ),
            Spacer(),
            Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
            )
          ],
        ),
      ),
    );
  }



}

