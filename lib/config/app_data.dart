import 'package:greengrocer/models/cart_item_model.dart';
import 'package:greengrocer/models/order_model.dart';
import 'package:greengrocer/models/product_item_model.dart';
import 'package:greengrocer/models/user_model.dart';
import 'package:greengrocer/utils/utils.services.dart';
import 'package:uuid/uuid.dart';

final UtilsServices utilsServices = UtilsServices();

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
  unit: "un",
  descript: "Descrição da Alface",
  price: 6.2,
);

ProductItemModel pimenta = ProductItemModel(
  name: "Alface",
  imageURL: "assets/products/pimenta.png",
  unit: "un",
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

final user = UserModel(
  id: utilsServices.getUUID(),
  name: "João da Silva",
  email: "joao@joao.com",
  phone: "(11) 91234-5678",
  cpf: "123.456.789-00",
  password: "123456",
);

List<OrderModel> orders = [
  OrderModel(
    id: utilsServices.getRandomNumber().toString(),
    createdOrder: DateTime.now(),
    pixOverDue: DateTime.parse("2026-12-01 14:00"),
    items: [
      CartItemModel(item: apple, quantity: 2),
      CartItemModel(item: pimenta, quantity: 5),
    ],
    status: "shipping",
    pixCopyAndPaste: Uuid().v8g(),
    total: 100,
  ),

  OrderModel(
    id: utilsServices.getRandomNumber().toString(),
    createdOrder: DateTime.now(),
    pixOverDue: DateTime.parse("2025-07-01 10:00"),
    items: [
      CartItemModel(item: arroz, quantity: 5),
      CartItemModel(item: kiwi, quantity: 3),
    ],
    status: "refunded",
    pixCopyAndPaste: Uuid().v8g(),
    total: 100,
  ),

  OrderModel(
    id: utilsServices.getRandomNumber().toString(),
    createdOrder: DateTime.now(),
    pixOverDue: DateTime.parse("2025-02-01 10:00"),
    items: [
      CartItemModel(item: alface, quantity: 2),
      CartItemModel(item: couveflor, quantity: 3),
    ],
    status: "pending_payment",
    pixCopyAndPaste: Uuid().v8g(),
    total: 100,
  ),
];
