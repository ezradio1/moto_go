import 'package:moto_go/constants/motorcycle_list.dart';
import 'package:moto_go/models/transaction.dart';

List<Transaction> transactionList = [
  Transaction(
      motorcycleList[0], 3, DateTime.now().subtract(const Duration(days: 5))),
  Transaction(
      motorcycleList[1], 3, DateTime.now().subtract(const Duration(days: 15))),
  Transaction(
      motorcycleList[2], 12, DateTime.now().subtract(const Duration(days: 23))),
  Transaction(
      motorcycleList[3], 6, DateTime.now().subtract(const Duration(days: 30))),
  Transaction(
      motorcycleList[4], 6, DateTime.now().subtract(const Duration(days: 60))),
  Transaction(
      motorcycleList[5], 6, DateTime.now().subtract(const Duration(days: 64))),
  Transaction(
      motorcycleList[6], 12, DateTime.now().subtract(const Duration(days: 75))),
];
