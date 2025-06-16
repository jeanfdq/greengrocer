import 'package:greengrocer/models/cart_item_model.dart';
import 'package:greengrocer/models/product_item_model.dart';

ProductItemModel apple = ProductItemModel(
  name: "Maçã",
  imageURL: "assets/products/apple.png",
  unit: "kg",
  descript: "Descrição da maçã",
  price: 8.5,
);

ProductItemModel grape = ProductItemModel(
  name: "Uva",
  imageURL: "assets/products/grape.png",
  unit: "kg",
  descript: "Descrição da uva",
  price: 12.9,
);

ProductItemModel guava = ProductItemModel(
  name: "Goiaba",
  imageURL: "assets/products/guava.png",
  unit: "kg",
  descript: "Descrição da goiaba",
  price: 4.85,
);

ProductItemModel kiwi = ProductItemModel(
  name: "Kiwi",
  imageURL: "assets/products/kiwi.png",
  unit: "kg",
  descript: "Descrição do Kiwi",
  price: 16.6,
);

ProductItemModel mango = ProductItemModel(
  name: "Manga",
  imageURL: "assets/products/mango.png",
  unit: "kg",
  descript: "Descrição da Manga",
  price: 5.5,
);

ProductItemModel couveflor = ProductItemModel(
  name: "Couve-Flor",
  imageURL: "assets/products/couve-flor.png",
  unit: "kg",
  descript: "Descrição da Couve-Flor",
  price: 4.5,
);

ProductItemModel alface = ProductItemModel(
  name: "Alface",
  imageURL: "assets/products/alface.png",
  unit: "Un",
  descript: "Descrição da Alface",
  price: 6.2,
);

ProductItemModel pimenta = ProductItemModel(
  name: "Alface",
  imageURL: "assets/products/pimenta.png",
  unit: "Un",
  descript: "Descrição da Pimenta",
  price: 3.13,
);

ProductItemModel chia = ProductItemModel(
  name: "Chia",
  imageURL: "assets/products/chia.png",
  unit: "kg",
  descript: "Descrição da Chia",
  price: 8.9,
);

ProductItemModel arroz = ProductItemModel(
  name: "Arroz",
  imageURL: "assets/products/arroz.png",
  unit: "kg",
  descript: "Descrição do Arroz",
  price: 16.45,
);

List<ProductItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  couveflor,
  alface,
  pimenta,
  chia,
  arroz,
];

List<String> categories = [
  "Todas",
  "Frutas",
  "Grãos",
  "Verduras",
  "Temperos",
  "Cereais",
  "Legumes",
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 2),
  CartItemModel(item: pimenta, quantity: 5),
  CartItemModel(item: arroz, quantity: 4),
  CartItemModel(item: alface, quantity: 2),
  CartItemModel(item: kiwi, quantity: 6),
  CartItemModel(item: couveflor, quantity: 1),
];
