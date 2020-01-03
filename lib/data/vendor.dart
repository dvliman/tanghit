
class FAQ {
  final String question;
  final String answer;

  FAQ({this.question, this.answer});
}

class SocialMedia {
  final String twitter;
  final String facebook;
  final String linkedin;
  final String youtube;
  final String youtubeURL; // maybe different from youtube handler
  final String instagram;
  final String pinterest;

  SocialMedia({
    this.twitter,
    this.facebook,
    this.linkedin,
    this.youtube,
    this.youtubeURL,
    this.instagram,
    this.pinterest,
  });
}

class BusinessHour {
  final String day;
  final String start;
  final String end;

  BusinessHour({this.day, this.start, this.end});
}

enum Category {
  boutique,
  home_baker,
}

// listing?
class Vendor {
  final String name;
  Category category;
  final String description;
  List<String> tags;
  final String address;
  double latitude;
  double longitude;
  final String phone;
  final String email;
  final String homepage;

  SocialMedia socialMedia;

  final String priceStatus;
  final double priceRangeFrom;
  final double priceRangeTo;
  final bool claimStatus;

  final List<FAQ> faqs;
  final List<String> photos;

  final String pricingPlanID;
  final List<BusinessHour> businessHours;
  final String tagline;
  final String location;
  bool internationalShipping;

  Vendor(
      {this.name,
      this.category,
      this.description,
      this.tags,
      this.address,
      this.latitude,
      this.longitude,
      this.phone,
      this.email,
      this.homepage,
      this.socialMedia,
      this.priceStatus,
      this.priceRangeFrom,
      this.priceRangeTo,
      this.claimStatus,
      this.faqs,
      this.photos,
      this.pricingPlanID,
      this.businessHours,
      this.tagline,
      this.location,
      this.internationalShipping});

  String get mainPhoto => "assets/images/first.jpg";
}
