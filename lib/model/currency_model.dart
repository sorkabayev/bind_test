class CurrencyList {
  String title = "\$USD";

  CurrencyList({required this.title});

  static List<CurrencyList> currencyList = [
    CurrencyList(title: " \$USD"),
    CurrencyList(title: " R RUB"),
    CurrencyList(title: " F GBP"),
  ];
}
