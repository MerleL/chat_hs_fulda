import 'package:flutter/material.dart';

// ToDo: Loesung fuer lange Namen/Staden
// ToDo Datenbank: Name, FD, Bild; Bild/Status änderbar

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Image(
                    image: AssetImage('assets/images/Logo.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(200, 240, 240, 240),
                    border: Border.all(
                      color: Color.fromARGB(255, 200, 200, 200),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.black,
                      child: Image(
                        image: AssetImage('assets/images/defaultImage.png'),
                      ),
                    ),
                  ),
                ),
              ),
              buildList(context, 'Name:', 'Mein Name'),
              buildList(context, 'FD Nummer:', 'Meine FD Nummer'),
              buildList(context, 'Handynummer:', '0123456789'),
              buildList(context, 'Status:', 'suche Lerngruppe'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, String about, String mine) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 8.0, 8.0, 15.0),
            child: Text(
              about,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 8.0, 30.0, 15.0),
            child: Text(
              mine,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
