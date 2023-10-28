import 'package:flutter/material.dart';
import 'package:moto_go/utils/format_price.dart';

class MotorcycleCard extends StatelessWidget {
  final String merk;
  final String brand;
  final String image;
  final double price;
  final int year;
  final bool isAvailable;
  const MotorcycleCard(
      {required this.brand,
      required this.merk,
      required this.image,
      required this.price,
      required this.year,
      required this.isAvailable,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 190,
        child: Card(
          color: Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Image.asset(
                      image,
                      height: 100,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '$brand ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        merk,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    year.toString(),
                    style: const TextStyle(fontSize: 12, color: Colors.black38),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatPriceWithCurrency(price),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: isAvailable ? Colors.green : Colors.red,
                          ),
                          child: Text(
                            isAvailable ? 'Available' : 'Full Booked',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ],
              )),
        ));
  }
}
