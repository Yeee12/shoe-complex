import "package:flutter/material.dart";

class ProductsCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundColor;
  const ProductsCard(
    {super.key,
  required this.title,
  required this.price,
  required this.image,
  required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: backgroundColor
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium,),
            const SizedBox(height: 5),
            Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
            const  SizedBox(height: 5),
             Center(
               child: Image(image: AssetImage(image),
               height: 175,
               ),
             ),
          ],
        ),
      ),
    );
  }
}