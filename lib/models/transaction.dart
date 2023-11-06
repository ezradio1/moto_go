import 'package:moto_go/models/motorcycle.dart';

class Transaction {
  Motorcycle item;
  int rentalDuration;
  DateTime rentalDate;

  Transaction(this.item, this.rentalDuration, this.rentalDate);
}
