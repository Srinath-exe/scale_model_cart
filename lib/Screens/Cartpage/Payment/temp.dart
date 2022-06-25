// Align(
//                                     alignment: Alignment.topRight,
//                                     child: Column(
//             children: [
//               FavoriteButton(
//                 iconSize: 40,
//                 valueChanged: (_isFavorite) {
//                   _isFavorite = !_isFavorite;
//                   _isFavorite == false
//                       ? Fluttertoast.showToast(
//                           msg: "Added to Wishlist",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.BOTTOM,
//                           timeInSecForIosWeb: 1,
//                           backgroundColor: Colors.grey[100],
//                           textColor: Colors.white,
//                           fontSize: 12.0)
//                       : Fluttertoast.showToast(
//                           msg: "Removed from Wishlist",
//                           toastLength: Toast.LENGTH_SHORT,
//                           gravity: ToastGravity.BOTTOM,
//                           timeInSecForIosWeb: 1,
//                           backgroundColor: Colors.grey[100],
//                           textColor: Colors.white,
//                           fontSize: 12.0);
//                 },
//               ),
//               IconButton(
//                 icon: add
//                     ? const Icon(
//                         Icons.add_shopping_cart_sharp,
//                         color: Colors.orange,
//                       )
//                     : const Icon(
//                         Icons.add_shopping_cart_sharp,
//                         color: Colors.black,
//                       ),
//                 onPressed: () {
//                   setState(() {
//                     add = !add;

//                     add == true
//                         ? Fluttertoast.showToast(
//                             msg: "Added to Cart",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.grey[100],
//                             textColor: Colors.white,
//                             fontSize: 12.0)
//                         : Fluttertoast.showToast(
//                             msg: "Removed from Cart",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.grey[100],
//                             textColor: Colors.white,
//                             fontSize: 12.0);
//                   });
//                 },
//               ),
//             ],
//           ),
//        ),
                                