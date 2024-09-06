import 'dart:convert';

class Giveaway {
  final int id;
  final String title;
  final String worth;
  final String thumbnail;
  final String image;
  final String description;
  final String instructions;
  final String openGiveawayUrl;
  final String published_date;
  final String type;
  final String platforms;
  final String end_date;
  final int users;
  final String status;
  final String gamerpowerUrl;
  final String openGiveaway;

  Giveaway({
    required this.id,
    required this.title,
    required this.worth,
    required this.thumbnail,
    required this.image,
    required this.description,
    required this.instructions,
    required this.openGiveawayUrl,
    required this.published_date,
    required this.type,
    required this.platforms,
    required this.end_date,
    required this.users,
    required this.status,
    required this.gamerpowerUrl,
    required this.openGiveaway,
  });

  factory Giveaway.fromRawJson(String str) =>
      Giveaway.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Giveaway.fromJson(Map<String, dynamic> json) => Giveaway(
        id: json["id"],
        title: json["title"],
        worth: json["worth"],
        thumbnail: json["thumbnail"],
        image: json["image"],
        description: json["description"],
        instructions: json["instructions"],
        openGiveawayUrl: json["open_giveaway_url"],
        published_date: json["published_date"],
        type: json["type"],
        platforms: json["platforms"],
        end_date: json["end_date"],
        users: json["users"],
        status: json["status"],
        gamerpowerUrl: json["gamerpower_url"],
        openGiveaway: json["open_giveaway"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "worth": worth,
        "thumbnail": thumbnail,
        "image": image,
        "description": description,
        "instructions": instructions,
        "open_giveaway_url": openGiveawayUrl,
        "published_date": published_date,
        "type": type,
        "platforms": platforms,
        "end_date": end_date,
        "users": users,
        "status": status,
        "gamerpower_url": gamerpowerUrl,
        "open_giveaway": openGiveaway,
      };
}
