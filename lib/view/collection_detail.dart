import 'package:flutter/material.dart';
import 'package:moto_go/constants/colors.dart';
import 'package:moto_go/models/motorcycle.dart';
import 'package:moto_go/utils/format_price.dart';
import 'package:moto_go/widget/button_custom.dart';
import 'package:moto_go/widget/chip.dart';
import 'package:moto_go/widget/custom_container.dart';
import 'package:moto_go/widget/dialog_coming_soon.dart';
import 'package:moto_go/widget/dialog_confirmation_rent.dart';
import 'package:moto_go/widget/dialog_rent_success.dart';

class CollectionDetail extends StatefulWidget {
  final Motorcycle selectedData;
  const CollectionDetail({super.key, required this.selectedData});

  @override
  State<CollectionDetail> createState() => _CollectionDetailState();
}

class _CollectionDetailState extends State<CollectionDetail> {
  bool isReadMoreActive = true;
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  int selectedRentalDuration = 3;

  void handleClickRentalDuration(int value) {
    setState(() {
      selectedRentalDuration = value;
    });
  }

  void handleClickOrder() {
    setState(() {
      isLoading.value = true;
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pop(context);
      setState(() {
        isLoading.value = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return DialogRentSuccess();
          });
    });
  }

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
                  RentalDuration(
                    selectedItem: selectedRentalDuration,
                    onTap: (value) => handleClickRentalDuration(value),
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
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => DialogConfirmationRent(
                          selectedData: selectedData,
                          rentalDuration: selectedRentalDuration,
                          onClickOrder: () {
                            handleClickOrder();
                          },
                          loading: isLoading,
                        )),
                text: 'Rent',
                type: ButtonType.outline,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 37,
              width: 37,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: ColorConstants.primary)),
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: ColorConstants.primary, // Warna ikon
                  size: 20.0, // Ukuran ikon
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const DialogComingSoon());
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

class RentalDuration extends StatelessWidget {
  final int selectedItem;
  final Function(int selectedItem) onTap;
  const RentalDuration(
      {super.key, required this.selectedItem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final List<int> rentalDuration = [3, 6, 12];
    return Row(
      children: rentalDuration
          .map((item) => GestureDetector(
              onTap: () {
                onTap(item);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: selectedItem == item
                          ? ColorConstants.primary
                          : Colors.black54),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '$item hours',
                  style: TextStyle(
                      color: selectedItem == item
                          ? ColorConstants.primary
                          : Colors.black54),
                ),
              )))
          .toList(),
    );
  }
}
