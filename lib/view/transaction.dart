import 'package:flutter/material.dart';
import 'package:moto_go/constants/transaction_list.dart';
import 'package:moto_go/widget/transaction_card.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: transactionList.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TransactionCard(data: transactionList[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
