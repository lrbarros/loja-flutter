import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja/tiles/category_tile.dart';

class ProductsTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("product").get(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
        }else{

            return ListView.separated(

                itemCount:   snapshot.data!.docs.length,
                separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
                itemBuilder: (BuildContext context, int index) {

                  return  CategoryTile(snapshot.data?.docs.asMap()[index] as DocumentSnapshot);

                },
              );

          }

    },
    );
  }
}
