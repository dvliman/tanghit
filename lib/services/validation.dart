class Validation {
  String validateKeyword(String keyword) {
    if (keyword.trim().length < 3) {
      return "keyword should be atleast 3 characters long";
    } else
      null;
  }
}
