class Champion {
  late String ability1;
  late String ability2;
  late String ability3;
  late String ability4;
  late String ability5;
  late int abilityId1;
  late int abilityId2;
  late int abilityId3;
  late int abilityId4;
  late int abilityId5;
  Ability? ability_1;
  Ability? ability_2;
  Ability? ability_3;
  Ability? ability_4;
  Ability? ability_5;
  late String championAbility1URL;
  late String championAbility2URL;
  late String championAbility3URL;
  late String championAbility4URL;
  late String championAbility5URL;
  late String championCardURL;
  late String championIconURL;
  late String cons;
  late int health;
  late String lore;
  late String name;
  late String nameEnglish;
  String? onFreeRotation;
  String? onFreeWeeklyRotation;
  String? pantheon;
  String? pros;
  String? roles;
  late int speed;
  late String title;
  String? type;
  late String abilityDescription1;
  late String abilityDescription2;
  late String abilityDescription3;
  late String abilityDescription4;
  late String abilityDescription5;
  late int id;
  late String latestChampion;
  String? retMsg;

  Champion(
      {required this.ability1,
      required this.ability2,
      required this.ability3,
      required this.ability4,
      required this.ability5,
      required this.abilityId1,
      required this.abilityId2,
      required this.abilityId3,
      required this.abilityId4,
      required this.abilityId5,
      this.ability_1,
      this.ability_2,
      this.ability_3,
      this.ability_4,
      this.ability_5,
      required this.championAbility1URL,
      required this.championAbility2URL,
      required this.championAbility3URL,
      required this.championAbility4URL,
      required this.championAbility5URL,
      required this.championCardURL,
      required this.championIconURL,
      required this.cons,
      required this.health,
      required this.lore,
      required this.name,
      required this.nameEnglish,
      this.onFreeRotation,
      this.onFreeWeeklyRotation,
      this.pantheon,
      this.pros,
      this.roles,
      required this.speed,
      required this.title,
      this.type,
      required this.abilityDescription1,
      required this.abilityDescription2,
      required this.abilityDescription3,
      required this.abilityDescription4,
      required this.abilityDescription5,
      required this.id,
      required this.latestChampion,
      this.retMsg});

  Champion.fromJson(dynamic json)
      : ability1 = json['Ability1'],
        ability2 = json['Ability2'],
        ability3 = json['Ability3'],
        ability4 = json['Ability4'],
        ability5 = json['Ability5'],
        abilityId1 = json['AbilityId1'],
        abilityId2 = json['AbilityId2'],
        abilityId3 = json['AbilityId3'],
        abilityId4 = json['AbilityId4'],
        abilityId5 = json['AbilityId5'],
        ability_1 = json['Ability_1'] != null ? Ability.fromJson(json['Ability_1']) : null,
        ability_2 = json['Ability_2'] != null ? Ability.fromJson(json['Ability_2']) : null,
        ability_3 = json['Ability_3'] != null ? Ability.fromJson(json['Ability_3']) : null,
        ability_4 = json['Ability_4'] != null ? Ability.fromJson(json['Ability_4']) : null,
        ability_5 = json['Ability_5'] != null ? Ability.fromJson(json['Ability_5']) : null,
        championAbility1URL = json['ChampionAbility1_URL'],
        championAbility2URL = json['ChampionAbility2_URL'],
        championAbility3URL = json['ChampionAbility3_URL'],
        championAbility4URL = json['ChampionAbility4_URL'],
        championAbility5URL = json['ChampionAbility5_URL'],
        championCardURL = json['ChampionCard_URL'],
        championIconURL = json['ChampionIcon_URL'],
        cons = json['Cons'],
        health = json['Health'],
        lore = json['Lore'],
        name = json['Name'],
        nameEnglish = json['Name_English'],
        onFreeRotation = json['OnFreeRotation'],
        onFreeWeeklyRotation = json['OnFreeWeeklyRotation'],
        pantheon = json['Pantheon'],
        pros = json['Pros'],
        roles = json['Roles'],
        speed = json['Speed'],
        title = json['Title'],
        type = json['Type'],
        abilityDescription1 = json['abilityDescription1'],
        abilityDescription2 = json['abilityDescription2'],
        abilityDescription3 = json['abilityDescription3'],
        abilityDescription4 = json['abilityDescription4'],
        abilityDescription5 = json['abilityDescription5'],
        id = json['id'],
        latestChampion = json['latestChampion'],
        retMsg = json['ret_msg'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Ability1'] = ability1;
    data['Ability2'] = ability2;
    data['Ability3'] = ability3;
    data['Ability4'] = ability4;
    data['Ability5'] = ability5;
    data['AbilityId1'] = abilityId1;
    data['AbilityId2'] = abilityId2;
    data['AbilityId3'] = abilityId3;
    data['AbilityId4'] = abilityId4;
    data['AbilityId5'] = abilityId5;

    data['Ability_1'] = ability_1?.toJson();

    data['Ability_2'] = ability_2?.toJson();

    data['Ability_3'] = ability_3?.toJson();

    data['Ability_4'] = ability_4?.toJson();

    data['Ability_5'] = ability_5?.toJson();

    data['ChampionAbility1_URL'] = championAbility1URL;
    data['ChampionAbility2_URL'] = championAbility2URL;
    data['ChampionAbility3_URL'] = championAbility3URL;
    data['ChampionAbility4_URL'] = championAbility4URL;
    data['ChampionAbility5_URL'] = championAbility5URL;
    data['ChampionCard_URL'] = championCardURL;
    data['ChampionIcon_URL'] = championIconURL;
    data['Cons'] = cons;
    data['Health'] = health;
    data['Lore'] = lore;
    data['Name'] = name;
    data['Name_English'] = nameEnglish;
    data['OnFreeRotation'] = onFreeRotation;
    data['OnFreeWeeklyRotation'] = onFreeWeeklyRotation;
    data['Pantheon'] = pantheon;
    data['Pros'] = pros;
    data['Roles'] = roles;
    data['Speed'] = speed;
    data['Title'] = title;
    data['Type'] = type;
    data['abilityDescription1'] = abilityDescription1;
    data['abilityDescription2'] = abilityDescription2;
    data['abilityDescription3'] = abilityDescription3;
    data['abilityDescription4'] = abilityDescription4;
    data['abilityDescription5'] = abilityDescription5;
    data['id'] = id;
    data['latestChampion'] = latestChampion;
    data['ret_msg'] = retMsg;
    return data;
  }
}

class Ability {
  late String description;
  late int id;
  late String summary;
  late String uRL;
  late String damageType;
  late int rechargeSeconds;

  Ability({
    required this.description,
    required this.id,
    required this.summary,
    required this.uRL,
    required this.damageType,
    required this.rechargeSeconds,
  });

  Ability.fromJson(dynamic json)
      : description = json['Description'],
        id = json['Id'],
        summary = json['Summary'],
        uRL = json['URL'],
        damageType = json['damageType'],
        rechargeSeconds = json['rechargeSeconds'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Description'] = description;
    data['Id'] = id;
    data['Summary'] = summary;
    data['URL'] = uRL;
    data['damageType'] = damageType;
    data['rechargeSeconds'] = rechargeSeconds;
    return data;
  }
}
