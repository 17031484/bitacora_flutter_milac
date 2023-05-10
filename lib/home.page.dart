import 'package:flutter/material.dart';
import 'package:test_app/navbar.dart';
import 'global.dart' as globals;

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  var data = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {return false;},
      child: MaterialApp(
        home: Scaffold(
          drawer: const NavBar(),
          appBar: AppBar(
            title: const Text('Inicio'),
            backgroundColor: Colors.blue,
          ),
            body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[buildTop(), buildContent()],
        )
        ),
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image(
          image: const AssetImage('images/nieve.jpg'),
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const AssetImage('images/user.png'),
      );

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, child: buildProfileImage())
      ],
    );
  }

  Widget buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(
            globals.operador,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(globals.unidad, style: const TextStyle(fontSize: 17)),
          Text('Número de viaje :${globals.no_viaje}' , style: const TextStyle(fontSize: 17)),
          Text('Ruta: ${globals.ruta}', style: const TextStyle(fontSize: 17)),
        ],
      ),
    );
  }
}
