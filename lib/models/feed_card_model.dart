class CardPostModel {
  bool cardStatus;
  String cardId;
  String userId;
  String title;
  String tags;
  String country;
  String state;
  String city;
  String latitude;
  String longitude;
  String description;
  DateTime postdate;

  CardPostModel(
      {this.cardStatus,
      this.cardId,
      this.userId,
      this.title,
      this.tags,
      this.country,
      this.state,
      this.city,
      this.latitude,
      this.longitude,
      this.description,
      this.postdate});

  CardPostModel.fromJson(Map<String, dynamic> json) {
    cardStatus = json['cardStatus'];
    cardId = json['cardId'];
    userId = json['userId'];
    title = json['title'];
    tags = json['tags'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    postdate = json['postdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['cardStatus'] = this.cardStatus;
    data['cardId'] = this.cardId;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['tags'] = this.tags;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['postdate'] = this.postdate;
    return data;
  }

  static CardPostModel hardcordedPost = CardPostModel(
      cardStatus: true,
      cardId: "1",
      userId: "1",
      description:
          "Our signature blue cotton top is surely a wardrobe staple. You can dress it up or dress it down.",
      country: "India",
      city: "Kaual",
      state: "Hawaii",
      tags: "#cotton #everydaycasals #officewears",
      postdate: DateTime.now(),
      latitude: "12.2",
      longitude: "14.4",
      title: "Uraban Dhara");
}
