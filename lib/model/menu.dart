import 'package:equatable/equatable.dart';

class Menu extends Equatable {
  final int id;
  final String name;
  final int price;
  final String image;
  final String type;

  const Menu(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.type});

  @override
  List<Object?> get props => [id, name, price, type];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'type': type
    };
  }
}

List<Menu> batchOfMenu = [
  const Menu(
      id: 1,
      name: "Beer",
      price: 10000,
      image: 'lib/images/beer.png',
      type: "drink"),
  const Menu(
      id: 2,
      name: "Cake",
      price: 10000,
      image: 'lib/images/cake.png',
      type: "food"),
  const Menu(
      id: 3,
      name: "Coconut Drink",
      price: 10000,
      image: 'lib/images/coconut.png',
      type: "drink"),
  const Menu(
      id: 4,
      name: "Coffee",
      price: 10000,
      image: 'lib/images/coffee.png',
      type: "drink"),
  const Menu(
      id: 5,
      name: "Croissant",
      price: 10000,
      image: 'lib/images/croissant.png',
      type: "food"),
  const Menu(
      id: 6,
      name: "Dumpling",
      price: 10000,
      image: 'lib/images/dumpling.png',
      type: "food"),
  const Menu(
      id: 7,
      name: "French Fries",
      price: 10000,
      image: 'lib/images/french-fries.png',
      type: "food"),
  const Menu(
      id: 8,
      name: "Hot Chocolate",
      price: 10000,
      image: 'lib/images/hot-chocolate.png',
      type: "drink"),
  const Menu(
      id: 9,
      name: "Lobster",
      price: 10000,
      image: 'lib/images/lobster.png',
      type: "food"),
  const Menu(
      id: 10,
      name: "Plain Milk",
      price: 10000,
      image: 'lib/images/milk.png',
      type: "drink"),
  const Menu(
      id: 11,
      name: "Mineral Water",
      price: 10000,
      image: 'lib/images/mineral-water.png',
      type: "drink"),
  const Menu(
      id: 12,
      name: "Noodles",
      price: 10000,
      image: 'lib/images/noodles.png',
      type: "food"),
  const Menu(
      id: 13,
      name: "Orange Juice",
      price: 10000,
      image: 'lib/images/orange-juice.png',
      type: "drink"),
  const Menu(
      id: 14,
      name: "Apple Pie",
      price: 10000,
      image: 'lib/images/pie.png',
      type: "food"),
  const Menu(
    id: 15,
    name: "Pizza",
    price: 10000,
    image: 'lib/images/pizza.png',
    type: "food",
  ),
];
