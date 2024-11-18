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


/** This is an auto generated class representing the Microcontroller type in your schema. */
class Microcontroller extends amplify_core.Model {
  static const classType = const _MicrocontrollerModelType();
  final String? _microcontrollerId;
  final Greenhouse? _greenhouse;
  final String? _microcontrollerName;
  final String? _publishTopic;
  final String? _subscribeTopic;
  final String? _rootCA;
  final String? _privateKey;
  final String? _certificate;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  MicrocontrollerModelIdentifier get modelIdentifier {
    try {
      return MicrocontrollerModelIdentifier(
        microcontrollerId: _microcontrollerId!
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
  
  String get microcontrollerId {
    try {
      return _microcontrollerId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Greenhouse? get greenhouse {
    return _greenhouse;
  }
  
  String? get microcontrollerName {
    return _microcontrollerName;
  }
  
  String? get publishTopic {
    return _publishTopic;
  }
  
  String? get subscribeTopic {
    return _subscribeTopic;
  }
  
  String? get rootCA {
    return _rootCA;
  }
  
  String? get privateKey {
    return _privateKey;
  }
  
  String? get certificate {
    return _certificate;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Microcontroller._internal({required microcontrollerId, greenhouse, microcontrollerName, publishTopic, subscribeTopic, rootCA, privateKey, certificate, createdAt, updatedAt}): _microcontrollerId = microcontrollerId, _greenhouse = greenhouse, _microcontrollerName = microcontrollerName, _publishTopic = publishTopic, _subscribeTopic = subscribeTopic, _rootCA = rootCA, _privateKey = privateKey, _certificate = certificate, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Microcontroller({required String microcontrollerId, Greenhouse? greenhouse, String? microcontrollerName, String? publishTopic, String? subscribeTopic, String? rootCA, String? privateKey, String? certificate}) {
    return Microcontroller._internal(
      microcontrollerId: microcontrollerId,
      greenhouse: greenhouse,
      microcontrollerName: microcontrollerName,
      publishTopic: publishTopic,
      subscribeTopic: subscribeTopic,
      rootCA: rootCA,
      privateKey: privateKey,
      certificate: certificate);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Microcontroller &&
      _microcontrollerId == other._microcontrollerId &&
      _greenhouse == other._greenhouse &&
      _microcontrollerName == other._microcontrollerName &&
      _publishTopic == other._publishTopic &&
      _subscribeTopic == other._subscribeTopic &&
      _rootCA == other._rootCA &&
      _privateKey == other._privateKey &&
      _certificate == other._certificate;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Microcontroller {");
    buffer.write("microcontrollerId=" + "$_microcontrollerId" + ", ");
    buffer.write("greenhouse=" + (_greenhouse != null ? _greenhouse!.toString() : "null") + ", ");
    buffer.write("microcontrollerName=" + "$_microcontrollerName" + ", ");
    buffer.write("publishTopic=" + "$_publishTopic" + ", ");
    buffer.write("subscribeTopic=" + "$_subscribeTopic" + ", ");
    buffer.write("rootCA=" + "$_rootCA" + ", ");
    buffer.write("privateKey=" + "$_privateKey" + ", ");
    buffer.write("certificate=" + "$_certificate" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Microcontroller copyWith({Greenhouse? greenhouse, String? microcontrollerName, String? publishTopic, String? subscribeTopic, String? rootCA, String? privateKey, String? certificate}) {
    return Microcontroller._internal(
      microcontrollerId: microcontrollerId,
      greenhouse: greenhouse ?? this.greenhouse,
      microcontrollerName: microcontrollerName ?? this.microcontrollerName,
      publishTopic: publishTopic ?? this.publishTopic,
      subscribeTopic: subscribeTopic ?? this.subscribeTopic,
      rootCA: rootCA ?? this.rootCA,
      privateKey: privateKey ?? this.privateKey,
      certificate: certificate ?? this.certificate);
  }
  
  Microcontroller copyWithModelFieldValues({
    ModelFieldValue<Greenhouse?>? greenhouse,
    ModelFieldValue<String?>? microcontrollerName,
    ModelFieldValue<String?>? publishTopic,
    ModelFieldValue<String?>? subscribeTopic,
    ModelFieldValue<String?>? rootCA,
    ModelFieldValue<String?>? privateKey,
    ModelFieldValue<String?>? certificate
  }) {
    return Microcontroller._internal(
      microcontrollerId: microcontrollerId,
      greenhouse: greenhouse == null ? this.greenhouse : greenhouse.value,
      microcontrollerName: microcontrollerName == null ? this.microcontrollerName : microcontrollerName.value,
      publishTopic: publishTopic == null ? this.publishTopic : publishTopic.value,
      subscribeTopic: subscribeTopic == null ? this.subscribeTopic : subscribeTopic.value,
      rootCA: rootCA == null ? this.rootCA : rootCA.value,
      privateKey: privateKey == null ? this.privateKey : privateKey.value,
      certificate: certificate == null ? this.certificate : certificate.value
    );
  }
  
  Microcontroller.fromJson(Map<String, dynamic> json)  
    : _microcontrollerId = json['microcontrollerId'],
      _greenhouse = json['greenhouse'] != null
        ? json['greenhouse']['serializedData'] != null
          ? Greenhouse.fromJson(new Map<String, dynamic>.from(json['greenhouse']['serializedData']))
          : Greenhouse.fromJson(new Map<String, dynamic>.from(json['greenhouse']))
        : null,
      _microcontrollerName = json['microcontrollerName'],
      _publishTopic = json['publishTopic'],
      _subscribeTopic = json['subscribeTopic'],
      _rootCA = json['rootCA'],
      _privateKey = json['privateKey'],
      _certificate = json['certificate'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'microcontrollerId': _microcontrollerId, 'greenhouse': _greenhouse?.toJson(), 'microcontrollerName': _microcontrollerName, 'publishTopic': _publishTopic, 'subscribeTopic': _subscribeTopic, 'rootCA': _rootCA, 'privateKey': _privateKey, 'certificate': _certificate, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'microcontrollerId': _microcontrollerId,
    'greenhouse': _greenhouse,
    'microcontrollerName': _microcontrollerName,
    'publishTopic': _publishTopic,
    'subscribeTopic': _subscribeTopic,
    'rootCA': _rootCA,
    'privateKey': _privateKey,
    'certificate': _certificate,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<MicrocontrollerModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<MicrocontrollerModelIdentifier>();
  static final MICROCONTROLLERID = amplify_core.QueryField(fieldName: "microcontrollerId");
  static final GREENHOUSE = amplify_core.QueryField(
    fieldName: "greenhouse",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Greenhouse'));
  static final MICROCONTROLLERNAME = amplify_core.QueryField(fieldName: "microcontrollerName");
  static final PUBLISHTOPIC = amplify_core.QueryField(fieldName: "publishTopic");
  static final SUBSCRIBETOPIC = amplify_core.QueryField(fieldName: "subscribeTopic");
  static final ROOTCA = amplify_core.QueryField(fieldName: "rootCA");
  static final PRIVATEKEY = amplify_core.QueryField(fieldName: "privateKey");
  static final CERTIFICATE = amplify_core.QueryField(fieldName: "certificate");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Microcontroller";
    modelSchemaDefinition.pluralName = "Microcontrollers";
    
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
      amplify_core.ModelIndex(fields: const ["microcontrollerId"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Microcontroller.MICROCONTROLLERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: Microcontroller.GREENHOUSE,
      isRequired: false,
      targetNames: ['microcontrollerGreenhouseId'],
      ofModelName: 'Greenhouse'
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Microcontroller.MICROCONTROLLERNAME,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Microcontroller.PUBLISHTOPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Microcontroller.SUBSCRIBETOPIC,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Microcontroller.ROOTCA,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Microcontroller.PRIVATEKEY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Microcontroller.CERTIFICATE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
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

class _MicrocontrollerModelType extends amplify_core.ModelType<Microcontroller> {
  const _MicrocontrollerModelType();
  
  @override
  Microcontroller fromJson(Map<String, dynamic> jsonData) {
    return Microcontroller.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Microcontroller';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Microcontroller] in your schema.
 */
class MicrocontrollerModelIdentifier implements amplify_core.ModelIdentifier<Microcontroller> {
  final String microcontrollerId;

  /** Create an instance of MicrocontrollerModelIdentifier using [microcontrollerId] the primary key. */
  const MicrocontrollerModelIdentifier({
    required this.microcontrollerId});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'microcontrollerId': microcontrollerId
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'MicrocontrollerModelIdentifier(microcontrollerId: $microcontrollerId)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is MicrocontrollerModelIdentifier &&
      microcontrollerId == other.microcontrollerId;
  }
  
  @override
  int get hashCode =>
    microcontrollerId.hashCode;
}