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
  final GeoPoint geopoint;
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
  final Timestamp created;
  bool internationalShipping;

  Vendor({this.name,
    this.description,
    this.tags,
    this.address,
    this.geopoint,
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
    this.created,
    this.internationalShipping});

  factory Vendor.fromDocument(DocumentSnapshot doc) {
    return Vendor(
      name: doc['name'] ?? "boutique-name",
      description: doc['description'] ?? "boutique-description",
      address: doc['address'] ?? "boutique-address",
      phone: doc['phone'] ?? "boutique-phone",
      email: doc['email'] ?? "boutique-email",
      homepage: doc['homepage'] ?? "boutique-homepage",
      socialMedia: SocialMedia(
        twitter: doc['socialMedia']['twitter'] ?? "tanghit",
        facebook: doc['socialMedia']['facebook'] ?? "tanghit",
        instagram: doc['socialMedia']['instagram'] ?? "tanghit",
        pinterest: doc['socialMedia']['pinterest'] ?? "tanghit",
      ),
      photos: List<String>.from(doc['photos']) ?? [],
      location: doc['location'] ?? "boutique-location",
      geopoint: doc['geopoint'] ?? GeoPoint(34.052235, -118.243683), // location
      created: doc['created'] ?? Timestamp.now(),
    );
  }

  String get mainPhoto => photos[0];
}
