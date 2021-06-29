class ReklamList {
  final String url;
  final int id;
  final String name;
  final String slug;
  final String phone;
  final String address;
  final String category;
  final String brand;
  final String subcategory;
  final double price;
  final int count;
  final String text;
  final List size;
  final List color;
  final String gender;
  final bool kredit;
  final bool obmen;
  ReklamList(
      this.url,
      this.id,
      this.name,
      this.slug,
      this.phone,
      this.address,
      this.category,
      this.brand,
      this.subcategory,
      this.price,
      this.count,
      this.text,
      this.size,
      this.color,
      this.gender,
      this.kredit,
      this.obmen);
  factory ReklamList.fromMap(Map<String, dynamic> json) {
    return ReklamList(
        json['url'],
        json['pk'],
        json['name'],
        json['slug'],
        json['phone'],
        json['address'],
        json['category'],
        json['brand'],
        json['subcategory'],
        json['price'],
        json['count'],
        json['text'],
        json['size'],
        json['color'],
        json['gender'],
        json['kredit'],
        json['obmen']);
  }
}

class FirmsList {
  final String url;
  final int id;
  final String name;
  final String email;
  final String webUrl;
  final String phone;
  final String address;
  final String text;

  FirmsList(this.url, this.id, this.name, this.email, this.webUrl, this.phone,
      this.address, this.text);
  factory FirmsList.fromMap(Map<String, dynamic> json) {
    return FirmsList(json['url'], json['pk'], json['name'], json['email'],
        json['webUrl'], json['phone'], json['address'], json['text']);
  }
}

class MessagesList {
  final String url;
  final int id;
  final String text;
  var date;
  final String recipient;
  final String sender;
  MessagesList(
      this.url, this.id, this.text, this.date, this.recipient, this.sender);
  factory MessagesList.fromMap(Map<String, dynamic> json) {
    return MessagesList(json['url'], json['pk'], json['text'], json['date'],
        json['recipient'], json['sender']);
  }
}

class NewsList {
  final String url;
  final int id;
  final String name;
  final String category;
  final String text;
  final String created;
  NewsList(
      this.url, this.id, this.name, this.category, this.text, this.created);
  factory NewsList.fromMap(Map<String, dynamic> json) {
    return NewsList(json['url'], json['pk'], json['name'], json['category'],
        json['text'], json['created']);
  }
}

class Categories {
  final int url;
  final String id;
  final String name;

  Categories(this.url, this.id, this.name);

  factory Categories.fromMap(Map<String, dynamic> json) {
    return Categories(json['url'], json['pk'], json['name']);
  }
}

class BrandsList {
  final String url;
  final int id;
  final String name;
  final String photo;
  final String category;
  BrandsList(this.url, this.id, this.name, this.photo, this.category);

  factory BrandsList.fromMap(Map<String, dynamic> json) {
    return BrandsList(
        json['url'], json['pk'], json['name'], json['photo'], json['category']);
  }
}

class SubCategories {
  final String url;
  final int id;
  final String name;
  final String category;

  SubCategories(this.url, this.id, this.name, this.category);

  factory SubCategories.fromMap(Map<String, dynamic> json) {
    return SubCategories(
        json['url'], json['pk'], json['name'], json['category']);
  }
}

class ColorList {
  final String url;
  final int id;
  final String name;

  ColorList(this.url, this.id, this.name);

  factory ColorList.fromMap(Map<String, dynamic> json) {
    return ColorList(json['url'], json['pk'], json['name']);
  }
}

class GenderList {
  final String url;
  final int id;
  final String name;

  GenderList(this.url, this.id, this.name);

  factory GenderList.fromMap(Map<String, dynamic> json) {
    return GenderList(json['url'], json['pk'], json['name']);
  }
}

class SizeList {
  final String url;
  final int id;
  final String name;

  SizeList(this.url, this.id, this.name);

  factory SizeList.fromMap(Map<String, dynamic> json) {
    return SizeList(json['url'], json['pk'], json['name']);
  }
}

class AddressList {
  final String url;
  final int id;
  final String name;
  final int regId;

  AddressList(this.url, this.id, this.name, this.regId);

  factory AddressList.fromMap(Map<String, dynamic> json) {
    return AddressList(json['url'], json['pk'], json['name'], json['regId']);
  }
}
