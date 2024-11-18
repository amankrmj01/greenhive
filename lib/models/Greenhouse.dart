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

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Greenhouse type in your schema. */
class Greenhouse extends amplify_core.Model {
  static const classType = const _GreenhouseModelType();
  final String? _greenhouseId;
  final String? _name;
  final String? _cropType;
  final String? _description;
  final int? _cropTimePeriod;
  final User? _user;
  final Microcontroller? _microcontroller;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  GreenhouseModelIdentifier get modelIdentifier {
    try {
      return GreenhouseModelIdentifier(
        greenhouseId: _greenhouseId!
      );
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get greenhouseId {
    try {
      return _greenhouseId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get name {
    return _name;
  }
  
  String? get cropType {
    return _cropType;
  }
  
  String? get description {
    return _description;
  }
  
  int? get cropTimePeriod {
    return _cropTimePeriod;
  }
  
  User? get user {
    return _user;
  }
  
  Microcontroller? get microcontroller {
    return _microcontroller;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Greenhouse._internal({required greenhouseId, name, cropType, description, cropTimePeriod, user, microcontroller, createdAt, updatedAt}): _greenhouseId = greenhouseId, _name = name, _cropType = cropType, _description = description, _cropTimePeriod = cropTimePeriod, _user = user, _microcontroller = microcontroller, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Greenhouse({required String greenhouseId, String? name, String? cropType, String? description, int? cropTimePeriod, User? user, Microcontroller? microcontroller}) {
    return Greenhouse._internal(
      greenhouseId: greenhouseId,
      name: name,
      cropType: cropType,
      description: description,
      cropTimePeriod: cropTimePeriod,
      user: user,
      microcontroller: microcontroller);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Greenhouse &&
      _greenhouseId == other._greenhouseId &&
      _name == other._name &&
      _cropType == other._cropType &&
      _description == other._description &&
      _cropTimePeriod == other._cropTimePeriod &&
      _user == other._user &&
      _microcontroller == other._microcontroller;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Greenhouse {");
    buffer.write("greenhouseId=" + "$_greenhouseId" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("cropType=" + "$_cropType" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("cropTimePeriod=" + (_cropTimePeriod != null ? _cropTimePeriod!.toString() : "null") + ", ");
    buffer.write("user=" + (_user != null ? _user!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Greenhouse copyWith({String? name, String? cropType, String? description, int? cropTimePeriod, User? user, Microcontroller? microcontroller}) {
    return Greenhouse._internal(
      greenhouseId: greenhouseId,
      name: name ?? this.name,
      cropType: cropType ?? this.cropType,
      description: description ?? this.description,
      cropTimePeriod: cropTimePeriod ?? this.cropTimePeriod,
      user: user ?? this.user,
      microcontroller: microcontroller ?? this.microcontroller);
  }
  
  Greenhouse copyWithModelFieldValues({
    ModelFieldValue<String?>? name,
    ModelFieldValue<String?>? cropType,
    ModelFieldValue<String?>? description,
    ModelFieldValue<int?>? cropTimePeriod,
    ModelFieldValue<User?>? user,
    ModelFieldValue<Microcontroller?>? microcontroller
  }) {
    return Greenhouse._internal(
      greenhouseId: greenhouseId,
      name: name == null ? this.name : name.value,
      cropType: cropType == null ? this.cropType : cropType.value,
      description: description == null ? this.description : description.value,
      cropTimePeriod: cropTimePeriod == null ? this.cropTimePeriod : cropTimePeriod.value,
      user: user == null ? this.user : user.value,
      microcontroller: microcontroller == null ? this.microcontroller : microcontroller.value
    );
  }
  
  Greenhouse.fromJson(Map<String, dynamic> json)  
    : _greenhouseId = json['greenhouseId'],
      _name = json['name'],
      _cropType = json['cropType'],
      _description = json['description'],
      _cropTimePeriod = (json['cropTimePeriod'] as num?)?.toInt(),
      _user = json['user'] != null
        ? json['user']['serializedData'] != null
          ? User.fromJson(new Map<String, dynamic>.from(json['user']['serializedData']))
          : User.fromJson(new Map<String, dynamic>.from(json['user']))
        : null,
      _microcontroller = json['microcontroller'] != null
        ? json['microcontroller']['serializedData'] != null
          ? Microcontroller.fromJson(new Map<String, dynamic>.from(json['microcontroller']['serializedData']))
          : Microcontroller.fromJson(new Map<String, dynamic>.from(json['microcontroller']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'greenhouseId': _greenhouseId, 'name': _name, 'cropType': _cropType, 'description': _description, 'cropTimePeriod': _cropTimePeriod, 'user': _user?.toJson(), 'microcontroller': _microcontroller?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'greenhouseId': _greenhouseId,
    'name': _name,
    'cropType': _cropType,
    'description': _description,
    'cropTimePeriod': _cropTimePeriod,
    'user': _user,
    'microcontroller': _microcontroller,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<GreenhouseModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<GreenhouseModelIdentifier>();
  static final GREENHOUSEID = amplify_core.QueryField(fieldName: "greenhouseId");
  static final NAME = amplify_core.QueryField(fieldName: "name");
  static final CROPTYPE = amplify_core.QueryField(fieldName: "cropType");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final CROPTIMEPERIOD = amplify_core.QueryField(fieldName: "cropTimePeriod");
  static final USER = amplify_core.QueryField(
    fieldName: "user",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'User'));
  static final MICROCONTROLLER = amplify_core.QueryField(
    fieldName: "microcontroller",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Microcontroller'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Greenhouse";
    modelSchemaDefinition.pluralName = "Greenhouses";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PRIVATE,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.indexes = [
      amplify_core.ModelIndex(fields: const ["greenhouseId"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Greenhouse.GREENHOUSEID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Greenhouse.NAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Greenhouse.CROPTYPE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Greenhouse.DESCRIPTION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Greenhouse.CROPTIMEPERIOD,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Greenhouse.USER,
      isRequired: false,
      targetNames: ['greenhouseUserId'],
      ofModelName: 'User'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.hasOne(
      key: Greenhouse.MICROCONTROLLER,
      isRequired: false,
      ofModelName: 'Microcontroller',
      associatedKey: Microcontroller.GREENHOUSE
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _GreenhouseModelType extends amplify_core.ModelType<Greenhouse> {
  const _GreenhouseModelType();
  
  @override
  Greenhouse fromJson(Map<String, dynamic> jsonData) {
    return Greenhouse.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Greenhouse';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Greenhouse] in your schema.
 */
class GreenhouseModelIdentifier implements amplify_core.ModelIdentifier<Greenhouse> {
  final String greenhouseId;

  /** Create an instance of GreenhouseModelIdentifier using [greenhouseId] the primary key. */
  const GreenhouseModelIdentifier({
    required this.greenhouseId});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'greenhouseId': greenhouseId
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'GreenhouseModelIdentifier(greenhouseId: $greenhouseId)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is GreenhouseModelIdentifier &&
      greenhouseId == other.greenhouseId;
  }
  
  @override
  int get hashCode =>
    greenhouseId.hashCode;
}