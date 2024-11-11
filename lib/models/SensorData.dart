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


/** This is an auto generated class representing the SensorData type in your schema. */
class SensorData extends amplify_core.Model {
  static const classType = const _SensorDataModelType();
  final String? _dataId;
  final amplify_core.TemporalTimestamp? _timestamp;
  final double? _temperature;
  final double? _humidity;
  final double? _co2;
  final double? _light;
  final double? _soilMoisture;
  final String? _modelRecommendation;
  final double? _actualFanSpeed;
  final double? _actualLightIntensity;
  final Microcontroller? _microcontroller;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();
  
  SensorDataModelIdentifier get modelIdentifier {
    try {
      return SensorDataModelIdentifier(
        dataId: _dataId!
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
  
  String get dataId {
    try {
      return _dataId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalTimestamp? get timestamp {
    return _timestamp;
  }
  
  double? get temperature {
    return _temperature;
  }
  
  double? get humidity {
    return _humidity;
  }
  
  double? get co2 {
    return _co2;
  }
  
  double? get light {
    return _light;
  }
  
  double? get soilMoisture {
    return _soilMoisture;
  }
  
  String? get modelRecommendation {
    return _modelRecommendation;
  }
  
  double? get actualFanSpeed {
    return _actualFanSpeed;
  }
  
  double? get actualLightIntensity {
    return _actualLightIntensity;
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
  
  const SensorData._internal({required dataId, timestamp, temperature, humidity, co2, light, soilMoisture, modelRecommendation, actualFanSpeed, actualLightIntensity, microcontroller, createdAt, updatedAt}): _dataId = dataId, _timestamp = timestamp, _temperature = temperature, _humidity = humidity, _co2 = co2, _light = light, _soilMoisture = soilMoisture, _modelRecommendation = modelRecommendation, _actualFanSpeed = actualFanSpeed, _actualLightIntensity = actualLightIntensity, _microcontroller = microcontroller, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory SensorData({required String dataId, amplify_core.TemporalTimestamp? timestamp, double? temperature, double? humidity, double? co2, double? light, double? soilMoisture, String? modelRecommendation, double? actualFanSpeed, double? actualLightIntensity, Microcontroller? microcontroller}) {
    return SensorData._internal(
      dataId: dataId,
      timestamp: timestamp,
      temperature: temperature,
      humidity: humidity,
      co2: co2,
      light: light,
      soilMoisture: soilMoisture,
      modelRecommendation: modelRecommendation,
      actualFanSpeed: actualFanSpeed,
      actualLightIntensity: actualLightIntensity,
      microcontroller: microcontroller);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SensorData &&
      _dataId == other._dataId &&
      _timestamp == other._timestamp &&
      _temperature == other._temperature &&
      _humidity == other._humidity &&
      _co2 == other._co2 &&
      _light == other._light &&
      _soilMoisture == other._soilMoisture &&
      _modelRecommendation == other._modelRecommendation &&
      _actualFanSpeed == other._actualFanSpeed &&
      _actualLightIntensity == other._actualLightIntensity &&
      _microcontroller == other._microcontroller;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("SensorData {");
    buffer.write("dataId=" + "$_dataId" + ", ");
    buffer.write("timestamp=" + (_timestamp != null ? _timestamp!.toString() : "null") + ", ");
    buffer.write("temperature=" + (_temperature != null ? _temperature!.toString() : "null") + ", ");
    buffer.write("humidity=" + (_humidity != null ? _humidity!.toString() : "null") + ", ");
    buffer.write("co2=" + (_co2 != null ? _co2!.toString() : "null") + ", ");
    buffer.write("light=" + (_light != null ? _light!.toString() : "null") + ", ");
    buffer.write("soilMoisture=" + (_soilMoisture != null ? _soilMoisture!.toString() : "null") + ", ");
    buffer.write("modelRecommendation=" + "$_modelRecommendation" + ", ");
    buffer.write("actualFanSpeed=" + (_actualFanSpeed != null ? _actualFanSpeed!.toString() : "null") + ", ");
    buffer.write("actualLightIntensity=" + (_actualLightIntensity != null ? _actualLightIntensity!.toString() : "null") + ", ");
    buffer.write("microcontroller=" + (_microcontroller != null ? _microcontroller!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  SensorData copyWith({amplify_core.TemporalTimestamp? timestamp, double? temperature, double? humidity, double? co2, double? light, double? soilMoisture, String? modelRecommendation, double? actualFanSpeed, double? actualLightIntensity, Microcontroller? microcontroller}) {
    return SensorData._internal(
      dataId: dataId,
      timestamp: timestamp ?? this.timestamp,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      co2: co2 ?? this.co2,
      light: light ?? this.light,
      soilMoisture: soilMoisture ?? this.soilMoisture,
      modelRecommendation: modelRecommendation ?? this.modelRecommendation,
      actualFanSpeed: actualFanSpeed ?? this.actualFanSpeed,
      actualLightIntensity: actualLightIntensity ?? this.actualLightIntensity,
      microcontroller: microcontroller ?? this.microcontroller);
  }
  
  SensorData copyWithModelFieldValues({
    ModelFieldValue<amplify_core.TemporalTimestamp?>? timestamp,
    ModelFieldValue<double?>? temperature,
    ModelFieldValue<double?>? humidity,
    ModelFieldValue<double?>? co2,
    ModelFieldValue<double?>? light,
    ModelFieldValue<double?>? soilMoisture,
    ModelFieldValue<String?>? modelRecommendation,
    ModelFieldValue<double?>? actualFanSpeed,
    ModelFieldValue<double?>? actualLightIntensity,
    ModelFieldValue<Microcontroller?>? microcontroller
  }) {
    return SensorData._internal(
      dataId: dataId,
      timestamp: timestamp == null ? this.timestamp : timestamp.value,
      temperature: temperature == null ? this.temperature : temperature.value,
      humidity: humidity == null ? this.humidity : humidity.value,
      co2: co2 == null ? this.co2 : co2.value,
      light: light == null ? this.light : light.value,
      soilMoisture: soilMoisture == null ? this.soilMoisture : soilMoisture.value,
      modelRecommendation: modelRecommendation == null ? this.modelRecommendation : modelRecommendation.value,
      actualFanSpeed: actualFanSpeed == null ? this.actualFanSpeed : actualFanSpeed.value,
      actualLightIntensity: actualLightIntensity == null ? this.actualLightIntensity : actualLightIntensity.value,
      microcontroller: microcontroller == null ? this.microcontroller : microcontroller.value
    );
  }
  
  SensorData.fromJson(Map<String, dynamic> json)  
    : _dataId = json['dataId'],
      _timestamp = json['timestamp'] != null ? amplify_core.TemporalTimestamp.fromSeconds(json['timestamp']) : null,
      _temperature = (json['temperature'] as num?)?.toDouble(),
      _humidity = (json['humidity'] as num?)?.toDouble(),
      _co2 = (json['co2'] as num?)?.toDouble(),
      _light = (json['light'] as num?)?.toDouble(),
      _soilMoisture = (json['soilMoisture'] as num?)?.toDouble(),
      _modelRecommendation = json['modelRecommendation'],
      _actualFanSpeed = (json['actualFanSpeed'] as num?)?.toDouble(),
      _actualLightIntensity = (json['actualLightIntensity'] as num?)?.toDouble(),
      _microcontroller = json['microcontroller'] != null
        ? json['microcontroller']['serializedData'] != null
          ? Microcontroller.fromJson(new Map<String, dynamic>.from(json['microcontroller']['serializedData']))
          : Microcontroller.fromJson(new Map<String, dynamic>.from(json['microcontroller']))
        : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'dataId': _dataId, 'timestamp': _timestamp?.toSeconds(), 'temperature': _temperature, 'humidity': _humidity, 'co2': _co2, 'light': _light, 'soilMoisture': _soilMoisture, 'modelRecommendation': _modelRecommendation, 'actualFanSpeed': _actualFanSpeed, 'actualLightIntensity': _actualLightIntensity, 'microcontroller': _microcontroller?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'dataId': _dataId,
    'timestamp': _timestamp,
    'temperature': _temperature,
    'humidity': _humidity,
    'co2': _co2,
    'light': _light,
    'soilMoisture': _soilMoisture,
    'modelRecommendation': _modelRecommendation,
    'actualFanSpeed': _actualFanSpeed,
    'actualLightIntensity': _actualLightIntensity,
    'microcontroller': _microcontroller,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<SensorDataModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<SensorDataModelIdentifier>();
  static final DATAID = amplify_core.QueryField(fieldName: "dataId");
  static final TIMESTAMP = amplify_core.QueryField(fieldName: "timestamp");
  static final TEMPERATURE = amplify_core.QueryField(fieldName: "temperature");
  static final HUMIDITY = amplify_core.QueryField(fieldName: "humidity");
  static final CO2 = amplify_core.QueryField(fieldName: "co2");
  static final LIGHT = amplify_core.QueryField(fieldName: "light");
  static final SOILMOISTURE = amplify_core.QueryField(fieldName: "soilMoisture");
  static final MODELRECOMMENDATION = amplify_core.QueryField(fieldName: "modelRecommendation");
  static final ACTUALFANSPEED = amplify_core.QueryField(fieldName: "actualFanSpeed");
  static final ACTUALLIGHTINTENSITY = amplify_core.QueryField(fieldName: "actualLightIntensity");
  static final MICROCONTROLLER = amplify_core.QueryField(
    fieldName: "microcontroller",
    fieldType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.model, ofModelName: 'Microcontroller'));
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "SensorData";
    modelSchemaDefinition.pluralName = "SensorData";
    
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
      amplify_core.ModelIndex(fields: const ["dataId"], name: null)
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.DATAID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.TIMESTAMP,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.TEMPERATURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.HUMIDITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.CO2,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.LIGHT,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.SOILMOISTURE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.MODELRECOMMENDATION,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.ACTUALFANSPEED,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: SensorData.ACTUALLIGHTINTENSITY,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
      key: SensorData.MICROCONTROLLER,
      isRequired: false,
      targetNames: ['microcontrollerId'],
      ofModelName: 'Microcontroller'
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

class _SensorDataModelType extends amplify_core.ModelType<SensorData> {
  const _SensorDataModelType();
  
  @override
  SensorData fromJson(Map<String, dynamic> jsonData) {
    return SensorData.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'SensorData';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [SensorData] in your schema.
 */
class SensorDataModelIdentifier implements amplify_core.ModelIdentifier<SensorData> {
  final String dataId;

  /** Create an instance of SensorDataModelIdentifier using [dataId] the primary key. */
  const SensorDataModelIdentifier({
    required this.dataId});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'dataId': dataId
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'SensorDataModelIdentifier(dataId: $dataId)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is SensorDataModelIdentifier &&
      dataId == other.dataId;
  }
  
  @override
  int get hashCode =>
    dataId.hashCode;
}