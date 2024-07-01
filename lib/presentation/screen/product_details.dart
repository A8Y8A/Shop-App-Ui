// import 'package:flutter/material.dart';

// class ProductDetailsPage extends StatelessWidget {
//   const ProductDetailsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Product Details')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Icon(Icons.image, size: 100),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Thin Choise Top Orange',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text('\$34.70/KG',
//                 style: TextStyle(fontSize: 20, color: Colors.blue)),
//             Text('Reg: \$56.70 USD',
//                 style: TextStyle(decoration: TextDecoration.lineThrough)),
//             Row(
//               children: [
//                 Icon(Icons.star, color: Colors.yellow),
//                 Text('4.5 (110 Reviews)'),
//               ],
//             ),
//             Divider(),
//             Text('Details'),
//             Text('Praesent commodo cursus magna...'),
//             SizedBox(height: 16),
//             Text('Nutritional facts'),
//             Divider(),
//             Text('Reviews'),
//             Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(onPressed: () {}, child: Text('Add To Cart')),
//                 ElevatedButton(onPressed: () {}, child: Text('Buy Now')),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
