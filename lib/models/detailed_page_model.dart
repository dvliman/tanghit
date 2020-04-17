class DetailedPageModel {
  bool cardStatus;
  String cardId;
  String userId;
  String title;
  String description;
  String category;
  List<String> imageList;

  DetailedPageModel(
      {this.cardStatus,
      this.cardId,
      this.userId,
      this.title,
      this.description,
      this.category,
      this.imageList});

  DetailedPageModel.fromJson(Map<String, dynamic> json) {
    cardStatus = json['cardStatus'];
    cardId = json['cardId'];
    userId = json['userId'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    imageList = json['imageList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['cardStatus'] = this.cardStatus;
    data['cardId'] = this.cardId;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['imageList'] = this.imageList;

    return data;
  }

  static DetailedPageModel hardcordedDetailedPage = DetailedPageModel(
    cardStatus: true,
    category: "Boutique",
    cardId: "1",
    userId: "1",
    description:
        "We are all about avant-garde dressing with indian roots inenergetic warm colours.",
    title: "Uraban Dhara",
    imageList: [
      'assets/images/design1.png',
      'assets/images/design2.png',
      'assets/images/design3.png',
      'assets/images/design4.png',
      'assets/images/design5.png',
      'assets/images/design6.png',
      'assets/images/design1.png',
      'assets/images/design2.png',
      'assets/images/design3.png',
      'assets/images/design4.png',
      'assets/images/design5.png',
      'assets/images/design6.png',
      'assets/images/design1.png',
      'assets/images/design2.png',
      'assets/images/design3.png',
      'assets/images/design4.png',
      'assets/images/design5.png',
      'assets/images/design6.png'
    ],
  );
}
