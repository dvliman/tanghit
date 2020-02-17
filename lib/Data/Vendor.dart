import 'package:cloud_firestore/cloud_firestore.dart';

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

class Vendor {
  final String name;
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

  factory Vendor.fromDocument(DocumentSnapshot doc) {
    return Vendor(
      name: doc['name'],
      description: doc['description'],
      address: doc['address'],
      phone: doc['phone'],
      email: doc['email'],
      homepage: doc['homepage'],
      socialMedia: SocialMedia(
        twitter: doc['socialMedia']['twitter'],
        facebook: doc['socialMedia']['facebook'],
        instagram: doc['socialMedia']['instagram'],
        pinterest: doc['socialMedia']['pinterest'],
      ),
      photos: List<String>.from(doc['photos']),
      location: doc['location'],
    );
  }

  String get mainPhoto => photos[0];
}
