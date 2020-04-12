class CardDetails {
  String documentId;
  String boutiqueName;
  List<String> tags;

  CardDetails({
    this.documentId,
    this.boutiqueName,
    this.tags,
  });

  static CardDetails hardcordedBusUserSubscription = CardDetails();
}
