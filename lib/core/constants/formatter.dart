import 'package:intl/intl.dart';

String priceFormat(dynamic price) {
  final currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  return currencyFormat.format(price);
}
