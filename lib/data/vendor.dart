class FAQ {
  String question;
  String answer;

  FAQ({this.question, this.answer});
}

class SocialMedia {
  String twitter;
  String facebook;
  String linkedin;
  String youtube;
  String youtubeURL; // maybe different from youtube handler
  String instagram;
  String pinterest;

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
  String day;
  String start;
  String end;

  BusinessHour({this.day, this.start, this.end});
}

enum Category {
  boutique,
  home_baker,
}

// listing?
class Vendor {
  String name;
  Category category;
  String description;
  List<String> tags;
  String address;
  double latitude;
  double longitude;
  String phone;
  String email;
  String homepage;

  SocialMedia socialMedia;

  String priceStatus;
  double priceRangeFrom;
  double priceRangeTo;
  bool claimStatus;

  List<FAQ> faqs;
  List<String> photos;

  String pricingPlanID;
  List<BusinessHour> businessHours;
  String tagline;
  String location;
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
}
