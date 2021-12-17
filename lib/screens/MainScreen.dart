import 'package:flutter/material.dart';
import 'package:flutter_tp6_v2/models/product.dart';
import 'package:flutter_tp6_v2/services/FireStoreDbService.dart';
import 'package:flutter_tp6_v2/widgets/Product_Dialog.dart';
import 'package:flutter_tp6_v2/widgets/ProductsList.dart';

class MainScreen extends StatelessWidget {
  // const MainScreen({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore Products Manager"),
      ),
      // -- Using a stream builder will update the UI
      // -- in real-time whenever data is changed in firebase
      body: StreamBuilder(
        stream: FireStoreDbService.products$,
        builder: (context, AsyncSnapshot<List<Product>> snapshot) {
          if (snapshot.hasData) {
            return ProductsList(
                // products: snapshot.data,
                );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ProductDialog(),
          );
        },
      ),
    );
  }
}
