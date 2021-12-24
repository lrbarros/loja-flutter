import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() =>
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 211, 118, 130),
                Color.fromARGB(255, 253, 181, 168),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        );

    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('home').orderBy('pos').get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else {

                  return SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 2,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      staggeredTileBuilder: (int index)  {

                        return  StaggeredTile.count(snapshot.data.docs.asMap()[index]['x'],
                                                        double.parse(snapshot.data.docs.asMap()[index]['y'].toString())
                                                    );

                      }
                  ,
                      itemBuilder: (BuildContext context, int index) {
                        return FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: snapshot.data.docs.asMap()[index]['image'],
                            fit: BoxFit.cover,);
                      },
                      itemCount: snapshot.data.docs.length
                  );


                }
              },
            )
          ],
        )
      ],
    );
  }
}
