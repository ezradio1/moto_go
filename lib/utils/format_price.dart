String formatPriceWithCurrency(double price) {
  String formattedPrice = price.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.');
  return 'Rp. $formattedPrice';
}
