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

  List<Vendor> get vendors => [first, second];
}
