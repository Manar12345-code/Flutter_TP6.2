import 'package:flutter/material.dart';
import 'package:flutter_tp6_v2/models/product.dart';
import 'package:flutter_tp6_v2/services/FireStoreDbService.dart';
import 'package:flutter_tp6_v2/widgets/Product_Dialog.dart';

import 'Product_Dialog.dart';

class ProductsList extends StatelessWidget {
  // -- This widget will be re-rendered when the parent stream updates
  late final List<Product> products;
  //const ProductsList({required Key key, required this.products}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        Product product = products[index];
        return ListTile(
          title: Text(
            product.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text('Costs: ${product.price}'),
          onTap: () {},
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => ProductDialog(
                        //product: product,
                        ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  FireStoreDbService.deleteProduct(product.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
