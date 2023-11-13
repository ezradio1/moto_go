import 'package:flutter/material.dart';
import 'package:moto_go/constants/fonts.dart';
import 'package:moto_go/models/motorcycle.dart';
import 'package:moto_go/utils/format_price.dart';
import 'package:moto_go/widget/button_custom.dart';

class DialogConfirmationRent extends StatefulWidget {
  final Motorcycle selectedData;
  final int rentalDuration;
  final Function onClickOrder;
  final ValueNotifier<bool> loading;
  const DialogConfirmationRent(
      {super.key,
      required this.selectedData,
      required this.rentalDuration,
      required this.onClickOrder,
      required this.loading});

  @override
  State<DialogConfirmationRent> createState() => _DialogConfirmationRentState();
}

class _DialogConfirmationRentState extends State<DialogConfirmationRent> {
  @override
  Widget build(BuildContext context) {
    widget.loading.addListener(() {
      setState(() {}); // Membuat ulang dialog saat isLoading berubah
    });
    final double totalPrice = widget.selectedData.price * widget.rentalDuration;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      title: const Text(
        'Confirm your order',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: RichText(
          text: TextSpan(
              style: const TextStyle(
                  color: Colors.black, fontFamily: FontConstants.primary),
              children: [
            const TextSpan(text: 'Are you sure you want to rent '),
            TextSpan(
                style: const TextStyle(fontWeight: FontWeight.bold),
                text: widget.selectedData.merk),
            const TextSpan(text: ' for '),
            TextSpan(
                style: const TextStyle(fontWeight: FontWeight.bold),
                text: '${widget.rentalDuration} hours '),
            const TextSpan(text: 'for a total price of '),
            TextSpan(
                style: const TextStyle(fontWeight: FontWeight.bold),
                text: '${formatPriceWithCurrency(totalPrice)} '),
            const TextSpan(text: '?')
          ])),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonCustom(
                  loading: widget.loading.value,
                  text: 'Cancel',
                  type: ButtonType.danger,
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              const SizedBox(
                width: 8,
              ),
              ButtonCustom(
                  loading: widget.loading.value,
                  text: 'Order',
                  onPressed: () {
                    widget.onClickOrder();
                  })
            ],
          ),
        ),
      ],
    );
  }
}
