import 'package:flutter/material.dart';
import 'package:loja/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  const CustomDrawer(this.pageController ) : super();

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 203, 236, 241),
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        );
    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 20.0),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 0.0),
                height: 130.0,
                child: Stack(
                  children: [
                    Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.ltr,
                            children: [
                          Text(
                            "DoceGab",
                            style: TextStyle(
                                fontSize: 30.0, fontWeight: FontWeight.bold,),
                          ),
                          Text(
                            "transformando amor em doce",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold,color: Color(0xffe192f7)),
                          )
                        ])),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Olá,",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(

                              child: Text(
                                "Entre ou cadastre-se >",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: (){},
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Divider(),
              DarwerTile(Icons.home,"Inicio",pageController,0),
              DarwerTile(Icons.list,"Produtos",pageController,1),
              DarwerTile(Icons.location_on,"Lojas",pageController,2),
              DarwerTile(Icons.playlist_add_check,"Meus Pedidos",pageController,3),

            ],
          )
        ],
      ),
    );
  }
}
