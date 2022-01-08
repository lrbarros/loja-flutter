import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja/datas/product_data.dart';
import 'package:loja/tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.get("title")),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.grid_on_outlined)),
                Tab(icon: Icon(Icons.list_outlined),)
              ],
            ),
          ),
          body: FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection("product").doc(snapshot.id)
                  .collection("itens").get(),
              builder:(context,snapshot){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator(),);
                }else{
                  return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      GridView.builder(
                        padding: EdgeInsets.all(4.0),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.65,
                          ),
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context,index){
                            return ProductTile("grid",ProductData.fromDocument(snapshot.data!.docs[index]));
                          }),
                     ListView.builder(
                       padding: EdgeInsets.all(4.0),
                         itemCount: snapshot.data?.docs.length,
                         itemBuilder: (context,index){
                           return ProductTile("list",ProductData.fromDocument(snapshot.data!.docs[index]));
                         }
                     )
                    ],
                  );
                }
              }

          )
        ));
  }
}
