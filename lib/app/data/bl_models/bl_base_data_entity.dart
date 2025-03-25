import 'dart:convert';

import '../../../generated/json/base/json_field.dart';
import '../../../generated/json/bl_base_data_entity.g.dart';

/// 有数据模型更新要执行下面语句 =>>
/// dart run build_runner build --delete-conflicting-outputs
@JsonSerializable()
class BlBaseEntity {
  List<BlUserEntity>? userList;
  List<BlFlowerEntity>? flowerList;

  BlBaseEntity();

  factory BlBaseEntity.fromJson(Map<String, dynamic> json) => $BlBaseEntityFromJson(json);

  Map<String, dynamic> toJson() => $BlBaseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

//////////////////////////////////////////////////////////////////////////////////////////

@JsonSerializable()
class BlUserEntity {
  String? userId;
  String? homeCover;
  String? title;
  String? des;
  String? nickName;
  String? avatar;
  List<String>? picList;

  bool? isFollowed; // 是否被关注
  bool? isCollected; // 是否被收藏
  bool? isLiked; //   是否被喜欢
  bool? isBlacked; //  是否被拉黑
  String? myId;

  BlUserEntity({
    this.userId,
    this.homeCover,
    this.title,
    this.des,
    this.nickName,
    this.avatar,
    this.picList,
  });

  factory BlUserEntity.fromJson(Map<String, dynamic> json) => $BlUserEntityFromJson(json);

  Map<String, dynamic> toJson() => $BlUserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

//////////////////////////////////////////////////////////////////////////////////////////

@JsonSerializable()
class BlFlowerEntity {
  String? flowerId;
  String? homeCover;
  String? title;
  String? des;
  List<String>? picList;

  bool? isFollowed; // 是否被关注
  bool? isCollected; // 是否被收藏
  bool? isLiked; //   是否被喜欢
  bool? isBlacked; //  是否被拉黑
  String? myId;

  BlFlowerEntity({
    this.flowerId,
    this.homeCover,
    this.title,
    this.des,
    this.picList,
  });

  factory BlFlowerEntity.fromJson(Map<String, dynamic> json) => $BlFlowerEntityFromJson(json);

  Map<String, dynamic> toJson() => $BlFlowerEntityToJson(this);
}

/**
    {
    "userId": "202530002",
    "homeCover": "assets/images/app/app_picList_4.png",
    "title": "",
    "des": "The sun is shining brightly today, and with my favorite accessory on, everything feels different. It's as if the world is full of infinite possibilities, all because of that one eye-catching gleam \uD83D\uDC8E.",
    "nickName": "Olivia",
    "avatar": "assets/images/app/app_avatar_2.png",
    "picList": [
    "assets/images/app/app_picList_4.png",
    "assets/images/app/app_picList_5.png"
    ]
    },
    {
    "userId": "202530003",
    "homeCover": "assets/images/app/app_picList_6.png",
    "title": "",
    "des": "Every little detail hides a love for life. Today, wearing this piece, I feel like the world is smiling back at me. Life is all about being exquisite and lighting up even the most ordinary days✨.",
    "nickName": "Ava",
    "avatar": "assets/images/app/app_avatar_3.png",
    "picList": [
    "assets/images/app/app_picList_6.png",
    "assets/images/app/app_picList_7.png",
    "assets/images/app/app_picList_8.png"
    ]
    },
    {
    "userId": "202530004",
    "homeCover": "assets/images/app/app_picList_9.png",
    "title": "",
    "des": "Sometimes, I can’t quite explain it, but just looking at these sparkling jewels makes me feel more confident and bright inside. Maybe they are my little daily encouragement\uD83D\uDC96.",
    "nickName": "Isabella",
    "avatar": "assets/images/app/app_avatar_4.png",
    "picList": [
    "assets/images/app/app_picList_9.png",
    "assets/images/app/app_picList_10.png"
    ]
    },
    {
    "userId": "202530005",
    "homeCover": "assets/images/app/app_picList_11.png",
    "title": "",
    "des": "With these jewels, I’ve come to realize that living exquisitely doesn’t mean seeking luxury, but rather finding the purest elegance and strength in the details✨.",
    "nickName": "Sophia",
    "avatar": "assets/images/app/app_avatar_5.png",
    "picList": [
    "assets/images/app/app_picList_11.png",
    "assets/images/app/app_picList_12.png"
    ]
    },
    {
    "userId": "202530006",
    "homeCover": "assets/images/app/app_picList_13.png",
    "title": "",
    "des": "Want to find a little sparkle in this ordinary day? Put on your favorite jewelry, and you’ll shine all day long✨\uD83D\uDC8E.",
    "nickName": "Mia",
    "avatar": "assets/images/app/app_avatar_6.png",
    "picList": [
    "assets/images/app/app_picList_13.png",
    "assets/images/app/app_picList_14.png",
    "assets/images/app/app_picList_15.png"
    ]
    },
    {
    "userId": "202530007",
    "homeCover": "assets/images/app/app_picList_16.png",
    "title": "",
    "des": "Time passes quietly, but behind every piece of jewelry is a story and a memory. They symbolize the beautiful moments in my life and always remind me to cherish every moment of brilliance\uD83D\uDC96.",
    "nickName": "Charlotte",
    "avatar": "assets/images/app/app_avatar_7.png",
    "picList": [
    "assets/images/app/app_picList_16.png",
    "assets/images/app/app_picList_17.png",
    "assets/images/app/app_picList_18.png"
    ]
    },
    {
    "userId": "202530008",
    "homeCover": "assets/images/app/app_picList_19.png",
    "title": "",
    "des": "Life is often busy, but whenever I pause and look at the gleam on my wrist, I feel a sense of calm and contentment I hadn’t felt in a while✨.",
    "nickName": "Amelia",
    "avatar": "assets/images/app/app_avatar_8.png",
    "picList": [
    "assets/images/app/app_picList_19.png",
    "assets/images/app/app_picList_20.png",
    "assets/images/app/app_picList_21.png"
    ]
    },
    {
    "userId": "202530009",
    "homeCover": "assets/images/app/app_picList_22.png",
    "title": "",
    "des": "Every day is a new beginning, and today, I choose to shine even brighter. With these little jewels by my side, any day can be full of brilliance\uD83D\uDC8E.",
    "nickName": "Harper",
    "avatar": "assets/images/app/app_avatar_9.png",
    "picList": [
    "assets/images/app/app_picList_22.png",
    "assets/images/app/app_picList_23.png"
    ]
    },
    {
    "userId": "2025300010",
    "homeCover": "assets/images/app/app_picList_24.png",
    "title": "",
    "des": "The best accessory isn’t the jewelry itself, but the confidence and grace it brings to us. Today, I feel more beautiful because of it\uD83D\uDC96.",
    "nickName": "Evelyn",
    "avatar": "assets/images/app/app_avatar_10.png",
    "picList": [
    "assets/images/app/app_picList_24.png",
    "assets/images/app/app_picList_25.png",
    "assets/images/app/app_picList_26.png"
    ]
    },
    {
    "userId": "2025300011",
    "homeCover": "assets/images/app/app_picList_27.png",
    "title": "",
    "des": "Every time I wear jewelry, it feels like adding a little magic to my life. No matter the time, having a shining heart makes life that much better✨.",
    "nickName": "Abigail",
    "avatar": "assets/images/app/app_avatar_11.png",
    "picList": [
    "assets/images/app/app_picList_27.png"
    ]
    },
    {
    "userId": "2025300012",
    "homeCover": "assets/images/app/app_picList_28.png",
    "title": "",
    "des": "I’m grateful for these jewels. They’re not just accessories, but companions for my soul. They keep me warm and elegant even in the busiest of days\uD83D\uDC96.",
    "nickName": "Elizabeth",
    "avatar": "assets/images/app/app_avatar_12.png",
    "picList": [
    "assets/images/app/app_picList_28.png",
    "assets/images/app/app_picList_29.png"
    ]
    }
 */

/**
    {
    "flowerId": "202530102",
    "homeCover": "assets/images/app/app_flower_2_0.png",
    "title": "LOVE pendant, 2 diamonds",
    "des": "A child of 1970s New York, the LOVE collection remains today an iconic symbol of love that transgresses convention. The screw motifs, ideal oval shape and undeniable elegance establish the piece as a timeless tribute to passionate romance. Studded with diamonds, yellow gold or rose gold: how far would you go for love?",
    "picList": [
    "assets/images/app/app_flower_2_0.png"
    ]
    },
    {
    "flowerId": "202530103",
    "homeCover": "assets/images/app/app_flower_3_0.png",
    "title": "Juste un Clou ring, small model, diamonds",
    "des": "A nail becomes jewelry. Designed in 1970s New York, the first Juste un Clou bracelet reflected a wild, freewheeling era. Bold, modern, and innovative, Juste un Clou is a creative twist on a familiar object. This jewelry collection transcends the everyday, making the ordinary exquisite, for him and for her.\nJuste un Clou ring, small model, 18K yellow gold (750/1000), set with brilliant-cut diamonds totaling 0.08 carat. Width: 1.8 mm (for size 52).",
    "picList": [
    "assets/images/app/app_flower_3_1.png",
    "assets/images/app/app_flower_3_2.png",
    "assets/images/app/app_flower_3_3.png",
    "assets/images/app/app_flower_3_4.png"
    ]
    },
    {
    "flowerId": "202530104",
    "homeCover": "assets/images/app/app_flower_4_0.png",
    "title": "Cartier d'Amour necklace XS",
    "des": "Cartier d'Amour is a round, delicate collection based on a reinterpretation of a 1938 model. The sparkle of each diamond in its closed setting is enhanced by the micro-paved belt that encircles it. \n Cartier d'Amour necklace\n\n18K yellow gold (750/1000)\n\nSet with a brilliant-cut diamond totaling 0.04 carat\n\nDiameter of the pattern: 3.79 mm\n\nChain length: 380 to 410 mm",
    "picList": [
    "assets/images/app/app_flower_4_0.png",
    "assets/images/app/app_flower_4_1.png"
    ]
    },
    {
    "flowerId": "202530105",
    "homeCover": "assets/images/app/app_flower_5_0.png",
    "title": "LOVE ring, classic model, 3 diamonds",
    "des": "A child of 1970s New York, the LOVE collection remains today an iconic symbol of love that transgresses convention. The screw motifs, ideal oval shape and undeniable elegance establish the piece as a timeless tribute to passionate romance. Studded with diamonds, yellow gold or rose gold: how far would you go for love?\n\nLOVE ring\n\nYellow gold (750/1000)\n\nSet with 3 brilliant-cut diamonds totaling 0.22 carats\n\nWidth: 5.5 mm (for size 52)",
    "picList": [
    "assets/images/app/app_flower_5_1.png",
    "assets/images/app/app_flower_5_2.png",
    "assets/images/app/app_flower_5_3.png"
    ]
    },
    {
    "flowerId": "202530106",
    "homeCover": "assets/images/app/app_flower_6_0.png",
    "title": "LOVE ring, classic model, 3 diamonds",
    "des": "Tiffany Knot is an expression of love’s unwavering bonds. Inspired by an archival bow crafted in 1889, Knot is a symbol of life’s most enduring ties and meaningful connections. This bangle is crafted of 18k rose gold and polished by hand for high shine. Each round brilliant diamond—specifically chosen to meet Tiffany’s high standards—is hand set at precise angles to maximize brilliance. Wear this bangle on its own or partnered with classic silhouettes for an unexpected pairing.\u202818k rose gold with pavé diamonds\u2028\u2028Wrist size, medium\u2028\u2028Fits wrists up to 6.25\"\u2028\u2028Carat total weight 1.906\n",
    "picList": [
    "assets/images/app/app_flower_6_1.png",
    "assets/images/app/app_flower_6_2.png",
    "assets/images/app/app_flower_6_3.png"
    ]
    },
    {
    "flowerId": "202530107",
    "homeCover": "assets/images/app/app_flower_7_0.png",
    "title": "LOVE ring, classic model, 3 diamonds",
    "des": "Tiffany HardWear is an expression of love’s transformative strength. Inspired by a quintessential bracelet from 1962 found in the House’s archives, HardWear embodies enduring resilience and uninhibited spirit. This 18k yellow gold ring features the collection’s signature gauge link design with a striking contrast of metal and diamonds. Tiffany artisans carefully hand set each diamond to achieve maximum shine. It makes a beautiful statement worn on its own or mixed with other metals.\u202818k yellow gold with diamonds\u2028\u2028Link size, small\u2028\u2028Carat total weight .269\n",
    "picList": [
    "assets/images/app/app_flower_7_1.png",
    "assets/images/app/app_flower_7_2.png",
    "assets/images/app/app_flower_7_3.png"
    ]
    },
    {
    "flowerId": "202530108",
    "homeCover": "assets/images/app/app_flower_8_0.png",
    "title": "Sapphire and Diamond Ring",
    "des": "Shimmering diamonds surround a velvety sapphire set in platinum. Round sapphire, carat weight .45; diamonds, carat total weight .36.",
    "picList": [
    "assets/images/app/app_flower_8_1.png",
    "assets/images/app/app_flower_8_2.png",
    "assets/images/app/app_flower_8_0.png"
    ]
    },
    {
    "flowerId": "202530109",
    "homeCover": "assets/images/app/app_flower_9_0.png",
    "title": "Color by the Yard Earrings",
    "des": "Earrings in 18k gold with emeralds.\u202818k gold with round emeralds\u2028\u2028Carat total weight .14\u2028\u2028Original designs copyrighted by the Nando and Elsa Peretti Foundation\n",
    "picList": [
    "assets/images/app/app_flower_9_1.png",
    "assets/images/app/app_flower_9_2.png"
    ]
    },
    {
    "flowerId": "2025301010",
    "homeCover": "assets/images/app/app_flower_10_0.png",
    "title": "Gübelin Vibrant Wings Sapphire Ring",
    "des": "The designer reinterpreted the microstructure of the gemstone into butterfly wings, using gradient blue-purple sapphires to set off the main stone, reminiscent of the gorgeous scene of a butterfly dancing in the sun.",
    "picList": [
    "assets/images/app/app_flower_10_0.png"
    ]
    }
 */