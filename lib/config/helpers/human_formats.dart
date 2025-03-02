import 'package:intl/intl.dart';

class HumanFormats {
  static String humanFormats(double number,[int decimal = 0]){
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: decimal,
      symbol: "",
      locale: "en"
    ).format(number);
    return formatterNumber ; 
  }
}