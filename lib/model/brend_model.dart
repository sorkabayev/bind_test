import 'package:intl/intl.dart';

class BrendModel {
  String? name;
  String? image;
  String? price;
  String? dateTime;

  BrendModel({
    required this.name,
    required this.price,
    required this.dateTime,
    required this.image,
  });

  static List<BrendModel> brend = [
    BrendModel(
      price: '55.31',
      image: 'asset/brands/pret.jpg',
      name: 'Pret A Manger',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
    BrendModel(
      price: '55.31',
      image: 'asset/brands/mc.jpg',
      name: 'McDonalds',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
    BrendModel(
      price: '55.31',
      image: 'asset/brands/starbucks.png',
      name: 'Starbucks',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
    BrendModel(
      price: '500.31',
      image: 'asset/brands/ver.webp',
      name: 'Vergin MegaStore',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
    BrendModel(
      price: '550.31',
      image: 'asset/brands/lu.png',
      name: 'Luis Vuitton',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
    BrendModel(
      price: '55.31',
      image: 'asset/brands/nike.png',
      name: 'Nike',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
    BrendModel(
      price: '55.31',
      image: 'asset/brands/starbucks.png',
      name: 'Starbucks',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
    BrendModel(
      price: '500.31',
      image: 'asset/brands/ver.webp',
      name: 'Vergin MegaStore',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
    BrendModel(
      price: '550.31',
      image: 'asset/brands/lu.png',
      name: 'Luis Vuitton',
      dateTime: DateFormat.Hm().format(DateTime.now()),
    ),
  ];
}
