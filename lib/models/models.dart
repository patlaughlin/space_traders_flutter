import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Data {
  final String token;
  final Agent agent;
  final Contract contract;
  final Faction faction;

  // final Ship ship;

  Data({
    required this.token,
    required this.agent,
    required this.contract,
    required this.faction,
    // required this.ship,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Agent {
  final String accountId;
  final String symbol;
  final String headquarters;
  final int credits;
  final String startingFaction;
  final int shipCount;

  Agent({
    required this.accountId,
    required this.symbol,
    required this.headquarters,
    required this.credits,
    required this.startingFaction,
    required this.shipCount,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);
}

@JsonSerializable()
class Contract {
  final String id;
  final String factionSymbol;
  final String type;
  final ContractTerms terms;
  final bool accepted;
  final bool fulfilled;
  final String expiration;
  final String deadlineToAccept;

  Contract({
    required this.id,
    required this.factionSymbol,
    required this.type,
    required this.terms,
    required this.accepted,
    required this.fulfilled,
    required this.expiration,
    required this.deadlineToAccept,
  });

  factory Contract.fromJson(Map<String, dynamic> json) =>
      _$ContractFromJson(json);

  Map<String, dynamic> toJson() => _$ContractToJson(this);
}

@JsonSerializable()
class ContractTerms {
  final String deadline;
  final ContractPayment payment;
  final List<ContractDeliverable> deliver;

  ContractTerms({
    required this.deadline,
    required this.payment,
    required this.deliver,
  });

  factory ContractTerms.fromJson(Map<String, dynamic> json) =>
      _$ContractTermsFromJson(json);

  Map<String, dynamic> toJson() => _$ContractTermsToJson(this);
}

@JsonSerializable()
class ContractPayment {
  final int onAccepted;
  final int onFulfilled;

  ContractPayment({
    required this.onAccepted,
    required this.onFulfilled,
  });

  factory ContractPayment.fromJson(Map<String, dynamic> json) =>
      _$ContractPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$ContractPaymentToJson(this);
}

@JsonSerializable()
class ContractDeliverable {
  final String tradeSymbol;
  final String destinationSymbol;
  final int unitsRequired;
  final int unitsFulfilled;

  ContractDeliverable({
    required this.tradeSymbol,
    required this.destinationSymbol,
    required this.unitsRequired,
    required this.unitsFulfilled,
  });

  factory ContractDeliverable.fromJson(Map<String, dynamic> json) =>
      _$ContractDeliverableFromJson(json);

  Map<String, dynamic> toJson() => _$ContractDeliverableToJson(this);
}

@JsonSerializable()
class Faction {
  final String symbol;
  final String name;
  final String description;
  final String headquarters;
  final List<Trait> traits;
  final bool isRecruiting;

  Faction({
    required this.symbol,
    required this.name,
    required this.description,
    required this.headquarters,
    required this.traits,
    required this.isRecruiting,
  });

  factory Faction.fromJson(Map<String, dynamic> json) =>
      _$FactionFromJson(json);

  Map<String, dynamic> toJson() => _$FactionToJson(this);
}

@JsonSerializable()
class Trait {
  final String symbol;
  final String name;
  final String description;

  Trait({
    required this.symbol,
    required this.name,
    required this.description,
  });

  factory Trait.fromJson(Map<String, dynamic> json) => _$TraitFromJson(json);

  Map<String, dynamic> toJson() => _$TraitToJson(this);
}

// @JsonSerializable()
// class Ship {
//   final String symbol;
//   final Nav nav;
//   final Crew crew;
//   final Fuel fuel;
//   final Cooldown cooldown;
//   final Frame frame;
//   final Reactor reactor;
//   final Engine engine;
//   final List<Module> modules;
//   final List<Mount> mounts;
//   final Registration registration;
//   final Cargo cargo;
//
//   Ship({
//     required this.symbol,
//     required this.nav,
//     required this.crew,
//     required this.fuel,
//     required this.cooldown,
//     required this.frame,
//     required this.reactor,
//     required this.engine,
//     required this.modules,
//     required this.mounts,
//     required this.registration,
//     required this.cargo,
//   });
//
//   factory Ship.fromJson(Map<String, dynamic> json) => _$ShipFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ShipToJson(this);
// }

// Add other classes similarly
