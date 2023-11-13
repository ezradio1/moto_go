import 'package:flutter/material.dart';
import 'package:moto_go/models/transaction.dart';
import 'package:moto_go/utils/format_price.dart';
import 'package:moto_go/widget/button_custom.dart';
import 'package:intl/intl.dart';
import 'package:moto_go/widget/dialog_coming_soon.dart';

class TransactionCard extends StatelessWidget {
  final Transaction data;
  const TransactionCard({super.key, required this.data});


  @override
  Widget build(BuildContext context) {
    void handleDialogComingSoon() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const DialogComingSoon();
          });
    }
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(width: 0.4, color: Colors.black45),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    child: Image.asset(data.item.image,
                        width: 48, height: 48, fit: BoxFit.cover),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${data.item.brand} ${data.item.merk} ${data.item.year}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${data.rentalDuration} hours',
                        style: const TextStyle(
                            fontSize: 12, color: Colors.black45),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                DateFormat('dd MMMM yyy').format(data.rentalDate),
                style: const TextStyle(color: Colors.black45, fontSize: 11),
              )
            ],
          ),
          const Divider(
            height: 24,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(fontSize: 12, color: Colors.black45),
                  ),
                  Text(
                    formatPriceWithCurrency(
                        data.item.price * data.rentalDuration),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  ButtonCustom(
                    text: 'Review',
                    onPressed: () {
                      handleDialogComingSoon();
                    },
                    type: ButtonType.outline,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ButtonCustom(
                      text: 'Rental Again',
                      onPressed: () {
                        handleDialogComingSoon();
                      })
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
