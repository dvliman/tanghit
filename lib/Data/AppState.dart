import 'package:scoped_model/scoped_model.dart';
import 'package:tanghit/Data/Vendor.dart';

class AppState extends Model {
  static Vendor first = Vendor(
      name: "Urban Dhara",
      category: Category.boutique,
      description:
          '''Urban Dhara is a clothing company that celebrates traditional artisan skills and creates handmade clothing in fine Indian fabrics. We use time-honoured methods for handcrafting clothes; clothes with deep-rooted Indian soul and glocal aesthetic appeal. Each piece of clothing is created with love, care and honesty.
        We draw inspiration from urban habitat, and the word ‘Dhara’ is colloquial for thread that is used by tailors and symbolizes strength and intricacy that flows constantly, unbroken like a stream, Womens Handmade Clothes in Bangalore.''',
      tags: ["dresses", "tops", "bottoms"],
      photos: [
        "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/70784159_2532193003668567_5574920060478160896_o.jpg?_nc_cat=105&_nc_ohc=PIF5IuwiCJsAX8HAAJ9&_nc_ht=scontent-lax3-1.xx&oh=cdd79c5df3ee212cc78e21d89a7d72df&oe=5ECCE4F3",
        "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/62198402_2451871468367388_8560856641203863552_o.jpg?_nc_cat=101&_nc_ohc=KTzrVePIVbAAX_ifdS0&_nc_ht=scontent-lax3-1.xx&oh=3cf8e34814fa91d47eecacb2579fb5e2&oe=5EC782B6"
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
    name: "Label Hiral vasa",
    category: Category.boutique,
    description: "Contemporary clothing line for women and mens wear",
    tags: ["indo-western", "blouses", "saree", "embroidery"],
    photos: [
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/78587097_689668078190051_4079619611463516160_o.jpg?_nc_cat=101&_nc_ohc=xqmE19TStnsAX_t1bBn&_nc_ht=scontent-lax3-1.xx&oh=baf021c798ac35a9311fff15eaba222a&oe=5E901E32",
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/69319012_623953611428165_6957882302676336640_o.jpg?_nc_cat=110&_nc_ohc=xohbelJrrvcAX9zjtbE&_nc_ht=scontent-lax3-1.xx&oh=971e893087ab87fb09922800750f5c1f&oe=5E978821",
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/59923965_558242107999316_7677454960170106880_o.jpg?_nc_cat=103&_nc_ohc=hFcz3QKE4ocAX_Pod-O&_nc_ht=scontent-lax3-1.xx&oh=f931b86fda94b7c1f1b62d6b33300670&oe=5E8FB407",
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/59414326_556051651551695_4247816771362357248_o.jpg?_nc_cat=108&_nc_ohc=iv3ac--d5LEAX_fHTx0&_nc_ht=scontent-lax3-1.xx&oh=2c62cc319c194f1c2cdfe7a27df1d123&oe=5EC4A85A",
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/62198402_2451871468367388_8560856641203863552_o.jpg?_nc_cat=101&_nc_ohc=KTzrVePIVbAAX_ifdS0&_nc_ht=scontent-lax3-1.xx&oh=3cf8e34814fa91d47eecacb2579fb5e2&oe=5EC782B6",
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
    photos: [
      "https://scontent-lax3-2.xx.fbcdn.net/v/t1.0-9/p960x960/71074052_2307100362936988_4164098787792388096_o.jpg?_nc_cat=111&_nc_ohc=K8dtKY3EMdYAX_V_R_Y&_nc_ht=scontent-lax3-2.xx&_nc_tp=6&oh=8e62e5bede690b8e5ba93bd485d8da3d&oe=5E9A1F9E",
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/70626622_2309239022723122_2198463376500195328_o.jpg?_nc_cat=101&_nc_ohc=78GbYJzpki0AX8UeDsq&_nc_ht=scontent-lax3-1.xx&oh=27469b9d08e3c53359780e42ac27f59f&oe=5ECC94D1",
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/65283681_2250663858580639_6993958571968823296_o.jpg?_nc_cat=103&_nc_ohc=bUAc2CCKWsQAX-7s7IP&_nc_ht=scontent-lax3-1.xx&oh=09b987f5f97b4c6a0a2adefcc980512f&oe=5E9B282C",
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/58443840_2204560836524275_6422457291416535040_o.jpg?_nc_cat=105&_nc_ohc=_WUfRSugLEIAX_uDRyt&_nc_ht=scontent-lax3-1.xx&oh=02894693330871758a4875e0dd888bfb&oe=5E96E8D7",
      "https://scontent-lax3-1.xx.fbcdn.net/v/t1.0-9/54095294_2177418012571891_6716630536506310656_o.jpg?_nc_cat=105&_nc_ohc=z9xq__t7qPoAX-BIZsl&_nc_ht=scontent-lax3-1.xx&oh=1bf12add0a272b63d0886444e0789a98&oe=5ED61988"
    ],
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
