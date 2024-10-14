part of 'models.dart';

enum FoodType { new_food, popular, recomended }

class Food extends Equatable {
  final int? id;
  final String? name;
  final String? picturePath;
  final String? description;
  final String? ingredients;
  final double? price;
  final double? rate;
  final List<FoodType> types;

  Food({
    this.id,
    this.name,
    this.picturePath,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
  });

  factory Food.fromJson(Map<String, dynamic> data) => Food(
    id: data['id'],
    name: data['name'],
    description: data['description'],
    ingredients: data['ingredient'],
    picturePath: data['picturePath'],
    price: data['price'].toDouble(),
    rate: data['rate'].toDouble(),
    types: data['types'].toString().split(',').map((e) {
      switch (e) {
        case 'new_food':
          return FoodType.new_food;
        case 'popular':
          return FoodType.popular;
        case 'recommended':
          return FoodType.recomended;
        default:
          return FoodType.new_food;
      }
    }).toList(),
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        picturePath,
        description,
        ingredients,
        price,
        rate,
      ];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath:
        'https://i.pinimg.com/236x/5b/f2/7e/5bf27e721ed7bc858e0a7f0d905632e8.jpg',
    name: 'Sate Sayur Sultan',
    description:
        'Sate Sayur Sultan adalah menu sate vegan paling terkenal di Jakarta. Sate ini dibuat dari berbagai macam bahan berkualitas terbaik dan langsung dibuat oleh chef handal. Sate ini sangat sehat dan bergizi.',
    ingredients: 'brokoli, wortel, tomat ceri, cabai hijau besar, dan tusuk sate. Untuk bumbu marinasi, diperlukan bawang putih, jahe, kecap manis, saus tiram, minyak wijen, garam, dan merica. Sedangkan untuk bumbu kacang, siapkan kacang tanah, bawang putih, cabai merah besar, daun jeruk, air, gula merah, dan kecap manis',
    price: 150000,
    rate: 4.2,
    types: [FoodType.new_food, FoodType.recomended]
  ),
  Food(
    id: 2,
    picturePath:
        'https://i.pinimg.com/236x/e4/c8/ac/e4c8ac48c71738d0493b6e824f0094ed.jpg',
    name: 'Nasi Goreng Kambing',
    description:
        'Nasi Goreng Kambing spesial dengan bumbu rempah rahasia yang kaya akan cita rasa. Cocok untuk Anda yang menggemari makanan gurih dan pedas.',
    ingredients: 'bawang putih, bawang merah, cabai merah, cabai rawit, daun bawang, kecap manis, saus tiram, garam, merica, minyak goreng, dan mentega. Untuk tambahan aroma dan rasa, siapkan pula daun jeruk, daun salam, serai, kayu manis, cengkeh, kapulaga, dan sedikit kunyit. Pelengkapnya bisa menggunakan telur dadar, acar, dan kerupuk',
    price: 25000,
    rate: 4.5,
    types: [FoodType.popular]
  ),
  Food(
    id: 3,
    picturePath:
        'https://i.pinimg.com/236x/1a/b7/ee/1ab7ee51c29e366c9c47311773c09dde.jpg',
    name: 'Mie Ayam Jamur',
    description:
        'Mie Ayam Jamur dengan topping ayam yang empuk dan jamur yang segar, disajikan dengan kuah kaldu yang lezat.',
    ingredients: 'kancing, bawang putih, bawang merah, daun bawang, jahe, kecap manis, kecap asin, saus tiram, minyak wijen, garam, gula, merica, minyak ayam (minyak hasil dari lemak ayam), dan kaldu ayam. Untuk pelengkap, siapkan caisim, bawang goreng, dan pangsit goreng atau rebus',
    price: 20000,
    rate: 4.7,
    types: [FoodType.popular]
  ),
  Food(
    id: 4,
    picturePath:
        'https://i.pinimg.com/236x/80/a9/1a/80a91a42cea42a2dcda727a48847642c.jpg',
    name: 'Bakso Beranak',
    description:
        'Bakso Beranak dengan ukuran jumbo berisi bakso kecil di dalamnya. Sangat cocok untuk pecinta makanan berkuah.',
    ingredients: 'bawang putih, bawang merah, merica bubuk, garam, gula, telur, es batu, dan kaldu sapi. Untuk isian bakso beranak, siapkan bakso kecil, telur rebus, dan bahan tambahan seperti cabai rawit, daging cincang, atau keju. Untuk kuah bakso, gunakan kaldu sapi, bawang putih, seledri, daun bawang, garam, dan merica. Pelengkap bisa berupa bihun, mie kuning, tahu, pangsit, sawi, sambal, kecap, dan bawang goreng',
    price: 30000,
    rate: 4.3,
    types: [FoodType.recomended]
  ),
  Food(
    id: 5,
    picturePath:
        'https://i.pinimg.com/236x/20/80/e0/2080e0aeb6d1d9c91b990892dcbbb455.jpg',
    name: 'Ayam Bakar Taliwang',
    description:
        'Ayam Bakar khas Lombok dengan bumbu pedas dan gurih, disajikan dengan plecing kangkung dan sambal terasi.',
    ingredients: 'bawang putih, cabai merah keriting, cabai rawit merah, terasi bakar, kemiri, gula merah, asam jawa, jeruk limau, garam, dan minyak goreng. Untuk bumbu olesan, siapkan minyak kelapa dan sisa bumbu halus. Pelengkapnya bisa berupa lalapan seperti mentimun, tomat, daun kemangi, dan terong bakar',
    price: 50000,
    rate: 4.8,
    types: [FoodType.new_food]
  ),
  Food(
    id: 6,
    picturePath:
        'https://i.pinimg.com/236x/6f/b7/f9/6fb7f9d36a80ee104e5a417ec2287b15.jpg',
    name: 'Gado-Gado Jakarta',
    description:
        'Gado-Gado dengan sayuran segar, tahu, tempe, dan lontong, disiram saus kacang kental yang gurih.',
    ingredients: 'kentang, tahu, tempe, telur rebus, lontong, mentimun, tomat, selada, dan kerupuk. Untuk bumbu kacang, siapkan kacang tanah goreng, bawang putih, cabai merah, gula merah, air asam jawa, garam, dan air matang. Pelengkapnya bisa berupa emping, bawang goreng, dan perasan jeruk limau',
    price: 20000,
    rate: 4.6,
  ),
  Food(
    id: 7,
    picturePath:
        'https://i.pinimg.com/236x/6e/35/3d/6e353dfdcef71ce2f3dfe363390cb6b4.jpg',
    name: 'Es Cendol Durian',
    description:
        'Minuman es cendol dengan topping buah durian yang manis dan creamy, cocok untuk menghilangkan dahaga.',
    ingredients: 'santan, gula merah, gula pasir, daun pandan, air, es batu, dan santan kental. Pelengkapnya bisa berupa tape singkong, kolang-kaling, dan kacang merah sesuai selera',
    price: 25000,
    rate: 4.4,
  ),
];
