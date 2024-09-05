// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      token: json['token'] as String,
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      faction: Faction.fromJson(json['faction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'token': instance.token,
      'agent': instance.agent,
      'contract': instance.contract,
      'faction': instance.faction,
    };

Agent _$AgentFromJson(Map<String, dynamic> json) => Agent(
      accountId: json['accountId'] as String,
      symbol: json['symbol'] as String,
      headquarters: json['headquarters'] as String,
      credits: (json['credits'] as num).toInt(),
      startingFaction: json['startingFaction'] as String,
      shipCount: (json['shipCount'] as num).toInt(),
    );

Map<String, dynamic> _$AgentToJson(Agent instance) => <String, dynamic>{
      'accountId': instance.accountId,
      'symbol': instance.symbol,
      'headquarters': instance.headquarters,
      'credits': instance.credits,
      'startingFaction': instance.startingFaction,
      'shipCount': instance.shipCount,
    };

Contract _$ContractFromJson(Map<String, dynamic> json) => Contract(
      id: json['id'] as String,
      factionSymbol: json['factionSymbol'] as String,
      type: json['type'] as String,
      terms: ContractTerms.fromJson(json['terms'] as Map<String, dynamic>),
      accepted: json['accepted'] as bool,
      fulfilled: json['fulfilled'] as bool,
      expiration: json['expiration'] as String,
      deadlineToAccept: json['deadlineToAccept'] as String,
    );

Map<String, dynamic> _$ContractToJson(Contract instance) => <String, dynamic>{
      'id': instance.id,
      'factionSymbol': instance.factionSymbol,
      'type': instance.type,
      'terms': instance.terms,
      'accepted': instance.accepted,
      'fulfilled': instance.fulfilled,
      'expiration': instance.expiration,
      'deadlineToAccept': instance.deadlineToAccept,
    };

ContractTerms _$ContractTermsFromJson(Map<String, dynamic> json) =>
    ContractTerms(
      deadline: json['deadline'] as String,
      payment:
          ContractPayment.fromJson(json['payment'] as Map<String, dynamic>),
      deliver: (json['deliver'] as List<dynamic>)
          .map((e) => ContractDeliverable.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContractTermsToJson(ContractTerms instance) =>
    <String, dynamic>{
      'deadline': instance.deadline,
      'payment': instance.payment,
      'deliver': instance.deliver,
    };

ContractPayment _$ContractPaymentFromJson(Map<String, dynamic> json) =>
    ContractPayment(
      onAccepted: (json['onAccepted'] as num).toInt(),
      onFulfilled: (json['onFulfilled'] as num).toInt(),
    );

Map<String, dynamic> _$ContractPaymentToJson(ContractPayment instance) =>
    <String, dynamic>{
      'onAccepted': instance.onAccepted,
      'onFulfilled': instance.onFulfilled,
    };

ContractDeliverable _$ContractDeliverableFromJson(Map<String, dynamic> json) =>
    ContractDeliverable(
      tradeSymbol: json['tradeSymbol'] as String,
      destinationSymbol: json['destinationSymbol'] as String,
      unitsRequired: (json['unitsRequired'] as num).toInt(),
      unitsFulfilled: (json['unitsFulfilled'] as num).toInt(),
    );

Map<String, dynamic> _$ContractDeliverableToJson(
        ContractDeliverable instance) =>
    <String, dynamic>{
      'tradeSymbol': instance.tradeSymbol,
      'destinationSymbol': instance.destinationSymbol,
      'unitsRequired': instance.unitsRequired,
      'unitsFulfilled': instance.unitsFulfilled,
    };

Faction _$FactionFromJson(Map<String, dynamic> json) => Faction(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      headquarters: json['headquarters'] as String,
      traits: (json['traits'] as List<dynamic>)
          .map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
      isRecruiting: json['isRecruiting'] as bool,
    );

Map<String, dynamic> _$FactionToJson(Faction instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'description': instance.description,
      'headquarters': instance.headquarters,
      'traits': instance.traits,
      'isRecruiting': instance.isRecruiting,
    };

Trait _$TraitFromJson(Map<String, dynamic> json) => Trait(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$TraitToJson(Trait instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'description': instance.description,
    };
