import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
  int? id;
  Name? name;
  List<String>? type;
  Base? base;
  String? species;
  String? description;
  Evolution? evolution;
  Profile? profile;
  Image? image;

  PokemonModel({
    this.id,
    this.name,
    this.type,
    this.base,
    this.species,
    this.description,
    this.evolution,
    this.profile,
    this.image,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json["id"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        type: json["type"] == null
            ? []
            : List<String>.from(json["type"]!.map((x) => x)),
        base: json["base"] == null ? null : Base.fromJson(json["base"]),
        species: json["species"],
        description: json["description"],
        evolution: json["evolution"] == null
            ? null
            : Evolution.fromJson(json["evolution"]),
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name?.toJson(),
        "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
        "base": base?.toJson(),
        "species": species,
        "description": description,
        "evolution": evolution?.toJson(),
        "profile": profile?.toJson(),
        "image": image?.toJson(),
      };
}

class Base {
  int? hp;
  int? attack;
  int? defense;
  int? spAttack;
  int? spDefense;
  int? speed;

  Base({
    this.hp,
    this.attack,
    this.defense,
    this.spAttack,
    this.spDefense,
    this.speed,
  });

  factory Base.fromJson(Map<String, dynamic> json) => Base(
        hp: json["HP"],
        attack: json["Attack"],
        defense: json["Defense"],
        spAttack: json["Sp. Attack"],
        spDefense: json["Sp. Defense"],
        speed: json["Speed"],
      );

  Map<String, dynamic> toJson() => {
        "HP": hp,
        "Attack": attack,
        "Defense": defense,
        "Sp. Attack": spAttack,
        "Sp. Defense": spDefense,
        "Speed": speed,
      };
}

class Evolution {
  List<List<String>>? next;

  Evolution({
    this.next,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        next: json["next"] == null
            ? []
            : List<List<String>>.from(
                json["next"]!.map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "next": next == null
            ? []
            : List<dynamic>.from(
                next!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}

class Image {
  String? sprite;
  String? thumbnail;
  String? hires;

  Image({
    this.sprite,
    this.thumbnail,
    this.hires,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        sprite: json["sprite"],
        thumbnail: json["thumbnail"],
        hires: json["hires"],
      );

  Map<String, dynamic> toJson() => {
        "sprite": sprite,
        "thumbnail": thumbnail,
        "hires": hires,
      };
}

class Name {
  String? english;
  String? japanese;
  String? chinese;
  String? french;

  Name({
    this.english,
    this.japanese,
    this.chinese,
    this.french,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        english: json["english"],
        japanese: json["japanese"],
        chinese: json["chinese"],
        french: json["french"],
      );

  Map<String, dynamic> toJson() => {
        "english": english,
        "japanese": japanese,
        "chinese": chinese,
        "french": french,
      };
}

class Profile {
  String? height;
  String? weight;
  List<String>? egg;
  List<List<String>>? ability;
  String? gender;

  Profile({
    this.height,
    this.weight,
    this.egg,
    this.ability,
    this.gender,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        height: json["height"],
        weight: json["weight"],
        egg: json["egg"] == null
            ? []
            : List<String>.from(json["egg"]!.map((x) => x)),
        ability: json["ability"] == null
            ? []
            : List<List<String>>.from(json["ability"]!
                .map((x) => List<String>.from(x.map((x) => x)))),
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "weight": weight,
        "egg": egg == null ? [] : List<dynamic>.from(egg!.map((x) => x)),
        "ability": ability == null
            ? []
            : List<dynamic>.from(
                ability!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "gender": gender,
      };
}
