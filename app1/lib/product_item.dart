import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.ratecount,
    required this.onTap,
    required this.icon,
  });
  final String image;
  final String name;
  final String price;
  final String rate;
  final String ratecount;
  final Function()? onTap;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 180,
                  height: 150,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  bottom: 5,
                  child: GestureDetector(
                    onTap: onTap,
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white,
                      child: icon,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/icons/star.png", width: 20),
                    SizedBox(width: 10),
                    Text(
                      "$rate ($ratecount)",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "\$ $price",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
