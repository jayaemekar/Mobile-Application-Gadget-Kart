import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gadget_kart/blocs/models/product_model.dart';
import 'package:flutter/material.dart';

import 'product/product_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: TextField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.purple, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.purple, width: 3),
              ),
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search'),
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
                .collection('products')
                .where('title', isGreaterThanOrEqualTo: name,)
                .snapshots()
            : FirebaseFirestore.instance
                .collection('products')
                .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return  const Center(
              child: Text("There is a problem",),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return ProductItem(
                 product: ProductModel.fromJson(snapshot.data.docs[index]),
                );
              },
            );
          }
          return  const Center(
            child: Text("There are no data",),
          );
        },
      ),
    );
  }
}
