import 'package:chat_hs_fulda/screens/profil_screen.dart';
import 'package:chat_hs_fulda/screens/settings_screen.dart';
import 'package:chat_hs_fulda/screens/single_chat_screen.dart';
import 'package:flutter/material.dart';

// ToDO: Sprachwahl, Suchen (Fachbereich auswählen, Dozent/Student/o.ä.) + hinzufuegen
// ToDo: DrawerHeader: Loesung fuer lange Namen, Bild aus Profil
// ToDo Datenbank: Chats auflisten + aufrufen

class ViewChat {
  AssetImage getImage;
  String name;
  Widget site;

  ViewChat(this.getImage, this.name, this.site);
}

class UebersichtScreen extends StatefulWidget {
  @override
  _UebersichtScreenState createState() => _UebersichtScreenState();
}

class _UebersichtScreenState extends State<UebersichtScreen> {
  List<ViewChat> chats = [
    ViewChat(AssetImage('assets/images/defaultImage.png'), 'Chat1',
        SingleChatScreen()),
    ViewChat(AssetImage('assets/images/defaultImage.png'), 'Chat2',
        SingleChatScreen()),
    ViewChat(AssetImage('assets/images/defaultImage.png'), 'Chat3',
        SingleChatScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: buildAppBar(),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                buildHeader(context),
                buildChatItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 1.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Container(
                  child: Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                child: Image(
                  image: AssetImage('assets/images/Logo.png'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 102, 197, 48),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black,
                      child: Image(
                        image: AssetImage('assets/images/defaultImage.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        // damit es kein Extra-Padding hat
                        padding: const EdgeInsets.all(0.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfilScreen()));
                      },
                      child: Text(
                        'Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          buildDrawerList(context, 'Chat suchen', UebersichtScreen()),
          buildDrawerList(context, 'Kontakt suchen', UebersichtScreen()),
          buildDrawerList(context, 'Gruppe erstellen', UebersichtScreen()),
          buildDrawerList(context, 'Einstellungen', SettingsScreen()),
        ],
      ),
    );
  }

  Widget buildDrawerList(BuildContext context, String text, screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        color: Color.fromARGB(200, 240, 240, 240),
        child: ListTile(
          title: Text(text),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          },
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: styleContainer(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Chatübersicht',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() {
    return Expanded(
      // ListView braucht definierte Größe -> Expanded = Groeße des restlichen Screens
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Image(
                  image: chats[index].getImage,
                ),
                title: Text(chats[index].name,
                    style: Theme.of(context).textTheme.headline3),
                subtitle: Text('Beschreibung'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => chats[index].site,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  BoxDecoration styleContainer() {
    return BoxDecoration(
      color: Color.fromARGB(200, 240, 240, 240),
      border: Border.all(
        color: Color.fromARGB(255, 200, 200, 200),
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ),
    );
  }
}
