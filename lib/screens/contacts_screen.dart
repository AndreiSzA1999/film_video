import 'package:film_video/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.search,
                color: Color(0xffb4b8cb),
                size: 26,
              ),
              title: Text("Mensajes",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Color(0xff2c2e67),
                      fontWeight: FontWeight.w600)),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.add,
                    color: Color(0xffb4b8cb),
                    size: 26,
                  ),
                )
              ],
              bottom: TabBar(
                controller: _tabController,
                unselectedLabelColor: Colors.grey,
                labelColor: Color(0xff6970f7),
                indicatorColor: Color(0xff6970f7),
                tabs: [
                  Tab(
                    text: "Todos",
                  ),
                  Tab(
                    text: "Trabajo",
                  ),
                  Tab(
                    text: "Familia",
                  ),
                  Tab(
                    text: "Amigos",
                  )
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  child: ListView(
                    children: [
                      Contact(
                        imagen: "assets/chat1.jpg",
                        nombre: "Anna Dalonzo",
                        lastMessage: "Hello! Sending money!",
                        hora: "12:47",
                        notificaciones: 2,
                      ),
                      Contact(
                        imagen: "assets/chat2.jpg",
                        nombre: "Tim Ostin",
                        lastMessage: "I don't think I can",
                        hora: "12:47",
                        notificaciones: 1,
                      ),
                      Contact(
                        imagen: "assets/chat3.jpg",
                        nombre: "Tom Green",
                        lastMessage: "I still need to think, I'll tell you",
                        hora: "Ayer",
                        notificaciones: 3,
                      ),
                      Contact(
                        imagen: "assets/chat4.jpg",
                        nombre: "Sindy Worrall",
                        lastMessage: "Ok Bye!",
                        hora: "Lunes",
                        notificaciones: 0,
                      ),
                    ],
                  ),
                ),
                ListView(),
                ListView(),
                ListView()
              ],
            )));
  }
}

class Contact extends StatelessWidget {
  final String imagen;
  final String nombre;
  final String lastMessage;
  final String hora;
  final int notificaciones;

  Contact({
    @required this.imagen,
    @required this.nombre,
    @required this.lastMessage,
    @required this.hora,
    @required this.notificaciones,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatPage(
                    nombre: nombre,
                    imagen: imagen,
                  )),
        );
      },
      child: Container(
        height: 80,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imagen),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(nombre,
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18)),
                SizedBox(
                  height: 5,
                ),
                Text(lastMessage,
                    style: GoogleFonts.roboto(
                        color: Colors.grey, fontWeight: FontWeight.w600))
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20.0,
                  ),
                  child: Text(hora,
                      style: GoogleFonts.roboto(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 13)),
                ),
                notificaciones == 0
                    ? Container(
                        height: 10,
                        width: 10,
                        color: Colors.transparent,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: Center(
                              child: Text(notificaciones.toString(),
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13))),
                        ),
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
