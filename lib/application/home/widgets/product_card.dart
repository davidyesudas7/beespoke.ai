import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
  });
  final String title;
  final String image;
  final String description;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 340,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
          ),
          Image.network(
            image,
            width: 150,
            height: 150,
          ),
          Text(
            '$price rupees',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Add To Cart 🛒')),
          )
        ],
      ),
    );
  }
}
