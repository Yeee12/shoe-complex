import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_complex/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl']as String),
              radius: 30,
            ),
            trailing: IconButton(onPressed: (){
              showDialog( barrierDismissible: false,
                context: context, 
              builder: (context){
                return AlertDialog(
                  title: Text('Delete Product', style: Theme.of(context).textTheme.titleMedium,
                  ),
                  content:const  Text('Are you sure '
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    },
                     child: const Text('No', style: TextStyle(
                      fontWeight: FontWeight.bold,
                     color:Colors.red,

                     )
                     ),
                     ),
                     TextButton(onPressed: (){
                      Provider.of<CartProvider>(context, listen: false).removeProduct(cartItem);
                        Navigator.of(context).pop();
                     },
                     child: const Text('Yes', style: TextStyle(
                       fontWeight: FontWeight.bold,
                     color:Colors.blue,
                     ),
                     ),
                     )
                  ],
                );
              }
              );
            },
            icon:const  Icon(Icons.delete),
            color: Colors.red,
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle:Text('Size: ${cartItem['size']}')
          );
        },
      ),
    );
  }
}
