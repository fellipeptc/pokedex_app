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
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Pokemon type in your schema. */
@immutable
class Pokemon extends Model {
  static const classType = const _PokemonModelType();
  final String id;
  final int? _position;
  final String? _name;
  final List<String>? _types;
  final String? _image;
  final int? _weight;
  final int? _height;
  final String? _status_id;
  final int? _generation;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int? get position {
    return _position;
  }
  
  String? get name {
    return _name;
  }
  
  List<String>? get types {
    return _types;
  }
  
  String? get image {
    return _image;
  }
  
  int? get weight {
    return _weight;
  }
  
  int? get height {
    return _height;
  }
  
  String? get status_id {
    return _status_id;
  }
  
  int? get generation {
    return _generation;
  }
  
  const Pokemon._internal({required this.id, position, name, types, image, weight, height, status_id, generation}): _position = position, _name = name, _types = types, _image = image, _weight = weight, _height = height, _status_id = status_id, _generation = generation;
  
  factory Pokemon({String? id, int? position, String? name, List<String>? types, String? image, int? weight, int? height, String? status_id, int? generation}) {
    return Pokemon._internal(
      id: id == null ? UUID.getUUID() : id,
      position: position,
      name: name,
      types: types != null ? List<String>.unmodifiable(types) : types,
      image: image,
      weight: weight,
      height: height,
      status_id: status_id,
      generation: generation);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pokemon &&
      id == other.id &&
      _position == other._position &&
      _name == other._name &&
      DeepCollectionEquality().equals(_types, other._types) &&
      _image == other._image &&
      _weight == other._weight &&
      _height == other._height &&
      _status_id == other._status_id &&
      _generation == other._generation;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Pokemon {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("position=" + (_position != null ? _position!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("types=" + (_types != null ? _types!.toString() : "null") + ", ");
    buffer.write("image=" + "$_image" + ", ");
    buffer.write("weight=" + (_weight != null ? _weight!.toString() : "null") + ", ");
    buffer.write("height=" + (_height != null ? _height!.toString() : "null") + ", ");
    buffer.write("status_id=" + "$_status_id" + ", ");
    buffer.write("generation=" + (_generation != null ? _generation!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Pokemon copyWith({String? id, int? position, String? name, List<String>? types, String? image, int? weight, int? height, String? status_id, int? generation}) {
    return Pokemon(
      id: id ?? this.id,
      position: position ?? this.position,
      name: name ?? this.name,
      types: types ?? this.types,
      image: image ?? this.image,
      weight: weight ?? this.weight,
      height: height ?? this.height,
      status_id: status_id ?? this.status_id,
      generation: generation ?? this.generation);
  }
  
  Pokemon.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _position = (json['position'] as num?)?.toInt(),
      _name = json['name'],
      _types = json['types']?.cast<String>(),
      _image = json['image'],
      _weight = (json['weight'] as num?)?.toInt(),
      _height = (json['height'] as num?)?.toInt(),
      _status_id = json['status_id'],
      _generation = (json['generation'] as num?)?.toInt();
  
  Map<String, dynamic> toJson() => {
    'id': id, 'position': _position, 'name': _name, 'types': _types, 'image': _image, 'weight': _weight, 'height': _height, 'status_id': _status_id, 'generation': _generation
  };

  static final QueryField ID = QueryField(fieldName: "pokemon.id");
  static final QueryField POSITION = QueryField(fieldName: "position");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField TYPES = QueryField(fieldName: "types");
  static final QueryField IMAGE = QueryField(fieldName: "image");
  static final QueryField WEIGHT = QueryField(fieldName: "weight");
  static final QueryField HEIGHT = QueryField(fieldName: "height");
  static final QueryField STATUS_ID = QueryField(fieldName: "status_id");
  static final QueryField GENERATION = QueryField(fieldName: "generation");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Pokemon";
    modelSchemaDefinition.pluralName = "Pokemon";
    
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
      key: Pokemon.POSITION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pokemon.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pokemon.TYPES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pokemon.IMAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pokemon.WEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pokemon.HEIGHT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pokemon.STATUS_ID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Pokemon.GENERATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
  });
}

class _PokemonModelType extends ModelType<Pokemon> {
  const _PokemonModelType();
  
  @override
  Pokemon fromJson(Map<String, dynamic> jsonData) {
    return Pokemon.fromJson(jsonData);
  }
}