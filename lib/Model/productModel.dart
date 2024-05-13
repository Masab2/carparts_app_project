import 'package:carparts_app_project/utils/Asset/imageAsset.dart';

class ProductModel {
  final String title;
  final String description;
  final String image;
  final String category;
  final String price;
  int quntity;
  bool isFav;

  ProductModel({
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
    required this.quntity,
    required this.isFav,
  });

  static List<ProductModel> model = [
    ProductModel(
      title: 'Black Flate Rims',
      description:
          """Enhance the aesthetics of your vehicle with these sleek and stylish black flat rims. Crafted with precision engineering, these rims not only elevate the appearance of your car but also ensure a smooth and comfortable ride. Made from high-quality materials, these rims are durable and built to last. Upgrade your vehicle's look and performance today!""",
      image: ImageAsset.rim,
      category: 'Rims',
      price: '200',
      quntity: 0, isFav: false,
    ),
    ProductModel(
      title: 'Wheels',
      description:
          'Experience superior performance and unmatched style with these high-quality wheels. Designed to deliver exceptional handling and stability, these wheels are perfect for both city driving and off-road adventures. Constructed with advanced materials and cutting-edge technology, these wheels offer durability, strength, and precision. Elevate your driving experience with these premium wheels!',
      image: ImageAsset.wheels,
      category: 'Wheels',
      price: '600',
      quntity: 0, isFav: false,
    ),
    ProductModel(
      title: 'Wheels',
      description:
          """Transform your vehicle into a masterpiece with these premium wheels. Crafted with attention to detail and precision, these wheels exude elegance and sophistication. Engineered for optimal performance and durability, they provide a smooth and comfortable ride on any terrain. Upgrade your car's appearance and performance with these top-of-the-line wheels today! """,
      image: ImageAsset.wheels,
      category: 'Wheels',
      price: '600',
      quntity: 0, isFav: false,
    ),
    ProductModel(
      title: 'Wheels',
      description:
          'Unleash the full potential of your vehicle with these top-of-the-line wheels. Engineered for maximum performance and durability, these wheels are designed to handle the most demanding driving conditions with ease. With their sleek design and superior craftsmanship, they not only enhance the look of your car but also improve its handling and stability. Take your driving experience to the next level with these premium wheels!',
      image: ImageAsset.wheels,
      category: 'Wheels',
      price: '600',
      quntity: 0, isFav: false,
    ),
  ];
}
