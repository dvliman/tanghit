import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/data/vendor.dart';

class AppState extends Model {
  static Vendor first = Vendor(
      name: "Urban Dhara",
      category: Category.boutique,
      description:
          '''Urban Dhara is a clothing company that celebrates traditional artisan skills and creates handmade clothing in fine Indian fabrics. We use time-honoured methods for handcrafting clothes; clothes with deep-rooted Indian soul and glocal aesthetic appeal. Each piece of clothing is created with love, care and honesty.
        We draw inspiration from urban habitat, and the word ‘Dhara’ is colloquial for thread that is used by tailors and symbolizes strength and intricacy that flows constantly, unbroken like a stream, Womens Handmade Clothes in Bangalore.''',
      tags: ["dresses", "tops", "bottoms"],
      photos: [
        "assets/images/first.jpg",
      ],
      address:
          "734, 1st floor, 22nd main, 12th cross, JP Nagar 2nd Phase.Bangalore - 560078, India",
      latitude: 12.907944,
      longitude: 77.587164,
      phone: "918026580924",
      email: "info@urbandhara.com",
      socialMedia: SocialMedia(
        instagram: "urbandharalabel",
      ),
      priceStatus: "inexpensive",
      priceRangeFrom: 1000,
      priceRangeTo: 5000,
      claimStatus: false,
      location: "Bangalore" // TODO: enum
      );

  static Vendor second = Vendor(
    name: "Label Hiral vasa ",
    category: Category.boutique,
    description: "Contemporary clothing line for women and mens wear",
    tags: ["indo-western", "blouses", "saree", "embroidery"],
    photos: [
      "assets/images/second.jpg",
    ],
    address: "Basavanagudi, bangalorea",
    phone: "9739271935",
    email: "labelhiralvasa@gmail.com",
    socialMedia: SocialMedia(
      facebook: "Labelhiralvasa",
      instagram: "labelhiralvasa",
    ),
    priceStatus: "inexpensive",
    priceRangeFrom: 1000,
    priceRangeTo: 5000,
    claimStatus: false,
    location: "Bangalore",
    internationalShipping: true,
  );

  static Vendor third = Vendor(
    name: "Studio Y",
    category: Category.boutique,
    description: '''We are a lifestyle store based in Bengaluru. Studio Y is a concept store retailing some fabulous designer labels across clothing, bags and lifestyle accessories. Our mission is to actively encourage and be instrumental in providing a platform for women entrepreneurs to showcase their creativity and passion.''',
    tags: ["tops", "tunics", "dresses", "skirts", "shrugs & capes"],
    photos: ["assets/images/third.jpg"],
    address: "#30, 1st Floor, Safina Plaza, Shivaji Nagar, Bengaluru – 560 001",
    phone: "9071999284",
    email: "Support@studioy.in",
    priceStatus: "moderate",
    priceRangeFrom: 0,
    priceRangeTo: 3000,
    claimStatus: false,
  );

  List<Vendor> get vendors => [first, second, third];
}
