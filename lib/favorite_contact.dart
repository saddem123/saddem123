import 'package:flutter/material.dart';

class FavoriteContact extends StatelessWidget {

  FavoriteContact({@required this.saved});

  final List<String> saved ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        title: Text("Favorite Contacts"),
      ),
      body: _buildContacts(),
    );
  }
  Widget _buildContacts() {
    List<Widget> _contactsWidgets = [];
    saved.forEach((String name){
      _contactsWidgets.add(_buildContact(name));
      _contactsWidgets.add(Divider());
    });

    return ListView(
      children: _contactsWidgets,
    );
  }

  Widget _buildContact(String name){
    var alreadySaved = saved.contains(name);
    return Container(
      margin: EdgeInsets.all(22),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey
        ),
        textAlign: TextAlign.start,
      ),
    );
  }



}