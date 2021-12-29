/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Stats type in your schema. */
@immutable
class Stats extends Model {
  static const classType = const _StatsModelType();
  final String id;
  final int? _hp;
  final int? _mana;
  final int? _attack;
  final int? _defense;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int? get hp {
    return _hp;
  }
  
  int? get mana {
    return _mana;
  }
  
  int? get attack {
    return _attack;
  }
  
  int? get defense {
    return _defense;
  }
  
  const Stats._internal({required this.id, hp, mana, attack, defense}): _hp = hp, _mana = mana, _attack = attack, _defense = defense;
  
  factory Stats({String? id, int? hp, int? mana, int? attack, int? defense}) {
    return Stats._internal(
      id: id == null ? UUID.getUUID() : id,
      hp: hp,
      mana: mana,
      attack: attack,
      defense: defense);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Stats &&
      id == other.id &&
      _hp == other._hp &&
      _mana == other._mana &&
      _attack == other._attack &&
      _defense == other._defense;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Stats {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("hp=" + (_hp != null ? _hp!.toString() : "null") + ", ");
    buffer.write("mana=" + (_mana != null ? _mana!.toString() : "null") + ", ");
    buffer.write("attack=" + (_attack != null ? _attack!.toString() : "null") + ", ");
    buffer.write("defense=" + (_defense != null ? _defense!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Stats copyWith({String? id, int? hp, int? mana, int? attack, int? defense}) {
    return Stats(
      id: id ?? this.id,
      hp: hp ?? this.hp,
      mana: mana ?? this.mana,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense);
  }
  
  Stats.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _hp = (json['hp'] as num?)?.toInt(),
      _mana = (json['mana'] as num?)?.toInt(),
      _attack = (json['attack'] as num?)?.toInt(),
      _defense = (json['defense'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'id': id, 'hp': _hp, 'mana': _mana, 'attack': _attack, 'defense': _defense
  };

  static final QueryField ID = QueryField(fieldName: "stats.id");
  static final QueryField HP = QueryField(fieldName: "hp");
  static final QueryField MANA = QueryField(fieldName: "mana");
  static final QueryField ATTACK = QueryField(fieldName: "attack");
  static final QueryField DEFENSE = QueryField(fieldName: "defense");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Stats";
    modelSchemaDefinition.pluralName = "Stats";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Stats.HP,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Stats.MANA,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Stats.ATTACK,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Stats.DEFENSE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}

class _StatsModelType extends ModelType<Stats> {
  const _StatsModelType();
  
  @override
  Stats fromJson(Map<String, dynamic> jsonData) {
    return Stats.fromJson(jsonData);
  }
}