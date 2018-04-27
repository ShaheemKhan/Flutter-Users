class User {
  int id;
  String name;
  String username;
  String email;
  Map address;
  String phone;
  String website;
  Map company;

  User(Map user) {
    this.id = user["id"];
    this.name = user["name"];
    this.username = user["username"];
    this.email = user["email"];
    this.address = user["address"];
    this.phone = user["phone"];
    this.website = user["website"];
    this.company = user["company"];
  }

  String getAddress() {
    return address["street"] + ", " + address["suite"];
  }

  String getCompany() {
    return company["name"] + ", " + company["catchPhrase"];
  }

}
