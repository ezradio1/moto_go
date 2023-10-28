import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/models/motorcycle.dart';
import 'package:moto_go/utils/format_price.dart';
import 'package:moto_go/widget/button_custom.dart';
import 'package:moto_go/widget/chip.dart';
import 'package:moto_go/widget/custom_container.dart';

class CollectionDetail extends StatefulWidget {
  final Motorcycle selectedData;
  const CollectionDetail({super.key, required this.selectedData});

  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  bool isReadMoreActive = true;
  @override
  Widget build(BuildContext context) {
    final selectedData = widget.selectedData;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            '${selectedData.brand} ${selectedData.merk}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: CustomContainer(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    selectedData.image,
                    width: double.infinity,
                    height: 320,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${selectedData.brand} ${selectedData.merk}',
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${formatPriceWithCurrency(selectedData.price)} / hour',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      StatusChip(
                        isAvailable: selectedData.isAvailable,
                        size: SizeOption.large,
                      )
                    ],
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Brand',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    selectedData.brand,
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Year',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    selectedData.year.toString(),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    selectedData.description,
                    textAlign: TextAlign.justify,
                    maxLines: isReadMoreActive ? null : 2,
                    overflow: isReadMoreActive ? null : TextOverflow.ellipsis,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          isReadMoreActive = !isReadMoreActive;
                        });
                      },
                      child: Text(
                        isReadMoreActive ? 'Read Less' : 'Read More',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ButtonCustom(
                onPressed: () {},
                text: 'Rent',
                type: ButtonType.outline,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: ColorConstants.primary)),
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: ColorConstants.primary, // Warna ikon
                  size: 24.0, // Ukuran ikon
                ),
                onPressed: () {
                  // Aksi yang diambil saat tombol ditekan
                },
              ),
            )
          ],
        ),
      )), // Widget yang tetap di bawah
    );
  }
}
