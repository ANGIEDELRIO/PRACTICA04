import 'dart:html';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Stack(
          children: [
            Background(),
            SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextoPrincipal(textoPrincipal: 'Kudos'),
                      SizedBox(height: 25),
                      Boton1(texto1: 'VIEW ALL'),
                      TextoSecundario(textoSecundario: 'favourites'),
                      Content2(),
                      TextoSecundario(textoSecundario: 'ALL'),
                      Content(),
                    ],
                  ),
                )),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color.fromRGBO(200, 200, 200, 0.9),
              primaryColor: Colors.blueGrey[600],
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.blueGrey[600]))),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'principal'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: 'message'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'profile'),
            ],
          ),
        ));
  }
}

class TextoSecundario extends StatelessWidget {
  final String textoSecundario;

  const TextoSecundario({Key key, this.textoSecundario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            textoSecundario,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}

class TextoPrincipal extends StatelessWidget {
  final String textoPrincipal;

  const TextoPrincipal({this.textoPrincipal});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        this.textoPrincipal,
        style: TextStyle(
          color: Colors.black,
          fontSize: 35,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}

class Boton1 extends StatelessWidget {
  final String texto1;

  const Boton1({this.texto1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(20)),
      child: Text(
        this.texto1,
        style: TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Content2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(children: [
      TableRow(
        children: [
          Item(
            color: Colors.blueGrey[700],
            icon: Icons.tv,
            texto: 'Washer Machine              4.6 ★ ★ ★ ★ ✰',
          ),
          Item(
            color: Colors.blueGrey[700],
            icon: Icons.mark_chat_read_outlined,
            texto: 'Dryer Machine             3.9 ★ ★ ★ ✰ ✰',
          ),
        ],
      ),
    ]);
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          Item(
            color: Colors.blueGrey[700],
            icon: Icons.microwave_outlined,
            texto: 'Microwawe Oven             4.6 ★ ★ ★ ★ ✰',
          ),
          Item(
            color: Colors.blueGrey[700],
            icon: Icons.widgets_outlined,
            texto: 'Whisk             3.3 ★ ★ ★ ✰ ✰',
          ),
        ]),
        TableRow(children: [
          Item(
            color: Colors.blueGrey[700],
            icon: Icons.speaker,
            texto: 'Speakers             4.6 ★ ★ ★ ★ ✰',
          ),
          Item(
              color: Colors.blueGrey[700],
              icon: Icons.airplay_sharp,
              texto: 'Air Conditioner             5.0 ★ ★ ★ ★ ★'),
        ]),
        TableRow(children: [
          Item(
            color: Colors.blueGrey[700],
            icon: Icons.radio,
            texto: 'Radio             4.1 ★ ★ ★ ★ ✰ ',
          ),
          Item(
            color: Colors.blueGrey[700],
            icon: Icons.tv,
            texto: 'Television             5.0 ★ ★ ★ ★ ★',
          ),
        ]),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String texto;

  const Item({@required this.color, this.icon, this.texto});

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(_screen.width * 0.05),
      height: _screen.width * 0.4,
      width: _screen.width * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(255, 255, 255, 0.8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 5),
              CircleAvatar(
                radius: 50,
                backgroundColor: this.color,
                child: Icon(
                  this.icon,
                  color: Colors.white,
                  size: 80,
                ),
              ),
              Text(
                this.texto,
                style: TextStyle(color: this.color),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;

    final principal = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              //begin: Alignment.topCenter,
              //end: Alignment.bottomCenter,
              begin: FractionalOffset(0, 0.5),
              end: FractionalOffset(0, 1),
              colors: [
            Colors.grey[200],
            Colors.white,
          ])),
    );
    final secondary = Transform.rotate(
        angle: -pi / 6,
        child: Container(
          width: _screen.width * 0.9,
          height: _screen.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.green[50]),
        ));

    return Stack(
      children: [principal, Positioned(top: -90, left: -30, child: secondary)],
    );
  }
}
