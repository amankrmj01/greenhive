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
  final amplify_core.TemporalTimestamp? _timestamp;
  final double? _temperature;
  final double? _humidity;
  final double? _co2;
  final double? _lightLevel;
  final double? _soilMoisture;
  final String? _modelRecommendation;
  final double? _actualFanSpeed;
  final double? _actualLightIntensity;
  final MicrocontrollerFanStatus? _fanStatus;
  final int? _fanSpeedSetting;
  final MicrocontrollerLightStatus? _lightStatus;
  final int? _lightIntensitySetting;
  final MicrocontrollerWaterPumpStatus? _waterPumpStatus;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();

  MicrocontrollerModelIdentifier get modelIdentifier {
    try {
      return MicrocontrollerModelIdentifier(
          microcontrollerId: _microcontrollerId!);
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get microcontrollerId {
    try {
      return _microcontrollerId!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  Greenhouse? get greenhouse {
    return _greenhouse;
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

  double? get lightLevel {
    return _lightLevel;
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

  MicrocontrollerFanStatus? get fanStatus {
    return _fanStatus;
  }

  int? get fanSpeedSetting {
    return _fanSpeedSetting;
  }

  MicrocontrollerLightStatus? get lightStatus {
    return _lightStatus;
  }

  int? get lightIntensitySetting {
    return _lightIntensitySetting;
  }

  MicrocontrollerWaterPumpStatus? get waterPumpStatus {
    return _waterPumpStatus;
  }

  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }

  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }

  const Microcontroller._internal(
      {required microcontrollerId,
      greenhouse,
      timestamp,
      temperature,
      humidity,
      co2,
      lightLevel,
      soilMoisture,
      modelRecommendation,
      actualFanSpeed,
      actualLightIntensity,
      fanStatus,
      fanSpeedSetting,
      lightStatus,
      lightIntensitySetting,
      waterPumpStatus,
      createdAt,
      updatedAt})
      : _microcontrollerId = microcontrollerId,
        _greenhouse = greenhouse,
        _timestamp = timestamp,
        _temperature = temperature,
        _humidity = humidity,
        _co2 = co2,
        _lightLevel = lightLevel,
        _soilMoisture = soilMoisture,
        _modelRecommendation = modelRecommendation,
        _actualFanSpeed = actualFanSpeed,
        _actualLightIntensity = actualLightIntensity,
        _fanStatus = fanStatus,
        _fanSpeedSetting = fanSpeedSetting,
        _lightStatus = lightStatus,
        _lightIntensitySetting = lightIntensitySetting,
        _waterPumpStatus = waterPumpStatus,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Microcontroller(
      {required String microcontrollerId,
      Greenhouse? greenhouse,
      amplify_core.TemporalTimestamp? timestamp,
      double? temperature,
      double? humidity,
      double? co2,
      double? lightLevel,
      double? soilMoisture,
      String? modelRecommendation,
      double? actualFanSpeed,
      double? actualLightIntensity,
      MicrocontrollerFanStatus? fanStatus,
      int? fanSpeedSetting,
      MicrocontrollerLightStatus? lightStatus,
      int? lightIntensitySetting,
      MicrocontrollerWaterPumpStatus? waterPumpStatus}) {
    return Microcontroller._internal(
        microcontrollerId: microcontrollerId,
        greenhouse: greenhouse,
        timestamp: timestamp,
        temperature: temperature,
        humidity: humidity,
        co2: co2,
        lightLevel: lightLevel,
        soilMoisture: soilMoisture,
        modelRecommendation: modelRecommendation,
        actualFanSpeed: actualFanSpeed,
        actualLightIntensity: actualLightIntensity,
        fanStatus: fanStatus,
        fanSpeedSetting: fanSpeedSetting,
        lightStatus: lightStatus,
        lightIntensitySetting: lightIntensitySetting,
        waterPumpStatus: waterPumpStatus);
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
        _timestamp == other._timestamp &&
        _temperature == other._temperature &&
        _humidity == other._humidity &&
        _co2 == other._co2 &&
        _lightLevel == other._lightLevel &&
        _soilMoisture == other._soilMoisture &&
        _modelRecommendation == other._modelRecommendation &&
        _actualFanSpeed == other._actualFanSpeed &&
        _actualLightIntensity == other._actualLightIntensity &&
        _fanStatus == other._fanStatus &&
        _fanSpeedSetting == other._fanSpeedSetting &&
        _lightStatus == other._lightStatus &&
        _lightIntensitySetting == other._lightIntensitySetting &&
        _waterPumpStatus == other._waterPumpStatus;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Microcontroller {");
    buffer.write("microcontrollerId=" + "$_microcontrollerId" + ", ");
    buffer.write("greenhouse=" +
        (_greenhouse != null ? _greenhouse.toString() : "null") +
        ", ");
    buffer.write("timestamp=" +
        (_timestamp != null ? _timestamp.toString() : "null") +
        ", ");
    buffer.write("temperature=" +
        (_temperature != null ? _temperature.toString() : "null") +
        ", ");
    buffer.write("humidity=" +
        (_humidity != null ? _humidity.toString() : "null") +
        ", ");
    buffer.write("co2=" + (_co2 != null ? _co2.toString() : "null") + ", ");
    buffer.write("lightLevel=" +
        (_lightLevel != null ? _lightLevel.toString() : "null") +
        ", ");
    buffer.write("soilMoisture=" +
        (_soilMoisture != null ? _soilMoisture.toString() : "null") +
        ", ");
    buffer.write("modelRecommendation=" + "$_modelRecommendation" + ", ");
    buffer.write("actualFanSpeed=" +
        (_actualFanSpeed != null ? _actualFanSpeed.toString() : "null") +
        ", ");
    buffer.write("actualLightIntensity=" +
        (_actualLightIntensity != null
            ? _actualLightIntensity.toString()
            : "null") +
        ", ");
    buffer.write("fanStatus=" +
        (_fanStatus != null ? amplify_core.enumToString(_fanStatus)! : "null") +
        ", ");
    buffer.write("fanSpeedSetting=" +
        (_fanSpeedSetting != null ? _fanSpeedSetting.toString() : "null") +
        ", ");
    buffer.write("lightStatus=" +
        (_lightStatus != null
            ? amplify_core.enumToString(_lightStatus)!
            : "null") +
        ", ");
    buffer.write("lightIntensitySetting=" +
        (_lightIntensitySetting != null
            ? _lightIntensitySetting.toString()
            : "null") +
        ", ");
    buffer.write("waterPumpStatus=" +
        (_waterPumpStatus != null
            ? amplify_core.enumToString(_waterPumpStatus)!
            : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Microcontroller copyWith(
      {Greenhouse? greenhouse,
      amplify_core.TemporalTimestamp? timestamp,
      double? temperature,
      double? humidity,
      double? co2,
      double? lightLevel,
      double? soilMoisture,
      String? modelRecommendation,
      double? actualFanSpeed,
      double? actualLightIntensity,
      MicrocontrollerFanStatus? fanStatus,
      int? fanSpeedSetting,
      MicrocontrollerLightStatus? lightStatus,
      int? lightIntensitySetting,
      MicrocontrollerWaterPumpStatus? waterPumpStatus}) {
    return Microcontroller._internal(
        microcontrollerId: microcontrollerId,
        greenhouse: greenhouse ?? this.greenhouse,
        timestamp: timestamp ?? this.timestamp,
        temperature: temperature ?? this.temperature,
        humidity: humidity ?? this.humidity,
        co2: co2 ?? this.co2,
        lightLevel: lightLevel ?? this.lightLevel,
        soilMoisture: soilMoisture ?? this.soilMoisture,
        modelRecommendation: modelRecommendation ?? this.modelRecommendation,
        actualFanSpeed: actualFanSpeed ?? this.actualFanSpeed,
        actualLightIntensity: actualLightIntensity ?? this.actualLightIntensity,
        fanStatus: fanStatus ?? this.fanStatus,
        fanSpeedSetting: fanSpeedSetting ?? this.fanSpeedSetting,
        lightStatus: lightStatus ?? this.lightStatus,
        lightIntensitySetting:
            lightIntensitySetting ?? this.lightIntensitySetting,
        waterPumpStatus: waterPumpStatus ?? this.waterPumpStatus);
  }

  Microcontroller copyWithModelFieldValues(
      {ModelFieldValue<Greenhouse?>? greenhouse,
      ModelFieldValue<amplify_core.TemporalTimestamp?>? timestamp,
      ModelFieldValue<double?>? temperature,
      ModelFieldValue<double?>? humidity,
      ModelFieldValue<double?>? co2,
      ModelFieldValue<double?>? lightLevel,
      ModelFieldValue<double?>? soilMoisture,
      ModelFieldValue<String?>? modelRecommendation,
      ModelFieldValue<double?>? actualFanSpeed,
      ModelFieldValue<double?>? actualLightIntensity,
      ModelFieldValue<MicrocontrollerFanStatus?>? fanStatus,
      ModelFieldValue<int?>? fanSpeedSetting,
      ModelFieldValue<MicrocontrollerLightStatus?>? lightStatus,
      ModelFieldValue<int?>? lightIntensitySetting,
      ModelFieldValue<MicrocontrollerWaterPumpStatus?>? waterPumpStatus}) {
    return Microcontroller._internal(
        microcontrollerId: microcontrollerId,
        greenhouse: greenhouse == null ? this.greenhouse : greenhouse.value,
        timestamp: timestamp == null ? this.timestamp : timestamp.value,
        temperature: temperature == null ? this.temperature : temperature.value,
        humidity: humidity == null ? this.humidity : humidity.value,
        co2: co2 == null ? this.co2 : co2.value,
        lightLevel: lightLevel == null ? this.lightLevel : lightLevel.value,
        soilMoisture:
            soilMoisture == null ? this.soilMoisture : soilMoisture.value,
        modelRecommendation: modelRecommendation == null
            ? this.modelRecommendation
            : modelRecommendation.value,
        actualFanSpeed:
            actualFanSpeed == null ? this.actualFanSpeed : actualFanSpeed.value,
        actualLightIntensity: actualLightIntensity == null
            ? this.actualLightIntensity
            : actualLightIntensity.value,
        fanStatus: fanStatus == null ? this.fanStatus : fanStatus.value,
        fanSpeedSetting: fanSpeedSetting == null
            ? this.fanSpeedSetting
            : fanSpeedSetting.value,
        lightStatus: lightStatus == null ? this.lightStatus : lightStatus.value,
        lightIntensitySetting: lightIntensitySetting == null
            ? this.lightIntensitySetting
            : lightIntensitySetting.value,
        waterPumpStatus: waterPumpStatus == null
            ? this.waterPumpStatus
            : waterPumpStatus.value);
  }

  Microcontroller.fromJson(Map<String, dynamic> json)
      : _microcontrollerId = json['microcontrollerId'],
        _greenhouse = json['greenhouse'] != null
            ? json['greenhouse']['serializedData'] != null
                ? Greenhouse.fromJson(new Map<String, dynamic>.from(
                    json['greenhouse']['serializedData']))
                : Greenhouse.fromJson(
                    new Map<String, dynamic>.from(json['greenhouse']))
            : null,
        _timestamp = json['timestamp'] != null
            ? amplify_core.TemporalTimestamp.fromSeconds(json['timestamp'])
            : null,
        _temperature = (json['temperature'] as num?)?.toDouble(),
        _humidity = (json['humidity'] as num?)?.toDouble(),
        _co2 = (json['co2'] as num?)?.toDouble(),
        _lightLevel = (json['lightLevel'] as num?)?.toDouble(),
        _soilMoisture = (json['soilMoisture'] as num?)?.toDouble(),
        _modelRecommendation = json['modelRecommendation'],
        _actualFanSpeed = (json['actualFanSpeed'] as num?)?.toDouble(),
        _actualLightIntensity =
            (json['actualLightIntensity'] as num?)?.toDouble(),
        _fanStatus = amplify_core.enumFromString<MicrocontrollerFanStatus>(
            json['fanStatus'], MicrocontrollerFanStatus.values),
        _fanSpeedSetting = (json['fanSpeedSetting'] as num?)?.toInt(),
        _lightStatus = amplify_core.enumFromString<MicrocontrollerLightStatus>(
            json['lightStatus'], MicrocontrollerLightStatus.values),
        _lightIntensitySetting =
            (json['lightIntensitySetting'] as num?)?.toInt(),
        _waterPumpStatus =
            amplify_core.enumFromString<MicrocontrollerWaterPumpStatus>(
                json['waterPumpStatus'], MicrocontrollerWaterPumpStatus.values),
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'microcontrollerId': _microcontrollerId,
        'greenhouse': _greenhouse?.toJson(),
        'timestamp': _timestamp?.toSeconds(),
        'temperature': _temperature,
        'humidity': _humidity,
        'co2': _co2,
        'lightLevel': _lightLevel,
        'soilMoisture': _soilMoisture,
        'modelRecommendation': _modelRecommendation,
        'actualFanSpeed': _actualFanSpeed,
        'actualLightIntensity': _actualLightIntensity,
        'fanStatus': amplify_core.enumToString(_fanStatus),
        'fanSpeedSetting': _fanSpeedSetting,
        'lightStatus': amplify_core.enumToString(_lightStatus),
        'lightIntensitySetting': _lightIntensitySetting,
        'waterPumpStatus': amplify_core.enumToString(_waterPumpStatus),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'microcontrollerId': _microcontrollerId,
        'greenhouse': _greenhouse,
        'timestamp': _timestamp,
        'temperature': _temperature,
        'humidity': _humidity,
        'co2': _co2,
        'lightLevel': _lightLevel,
        'soilMoisture': _soilMoisture,
        'modelRecommendation': _modelRecommendation,
        'actualFanSpeed': _actualFanSpeed,
        'actualLightIntensity': _actualLightIntensity,
        'fanStatus': _fanStatus,
        'fanSpeedSetting': _fanSpeedSetting,
        'lightStatus': _lightStatus,
        'lightIntensitySetting': _lightIntensitySetting,
        'waterPumpStatus': _waterPumpStatus,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<MicrocontrollerModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<MicrocontrollerModelIdentifier>();
  static final MICROCONTROLLERID =
      amplify_core.QueryField(fieldName: "microcontrollerId");
  static final GREENHOUSE = amplify_core.QueryField(
      fieldName: "greenhouse",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Greenhouse'));
  static final TIMESTAMP = amplify_core.QueryField(fieldName: "timestamp");
  static final TEMPERATURE = amplify_core.QueryField(fieldName: "temperature");
  static final HUMIDITY = amplify_core.QueryField(fieldName: "humidity");
  static final CO2 = amplify_core.QueryField(fieldName: "co2");
  static final LIGHTLEVEL = amplify_core.QueryField(fieldName: "lightLevel");
  static final SOILMOISTURE =
      amplify_core.QueryField(fieldName: "soilMoisture");
  static final MODELRECOMMENDATION =
      amplify_core.QueryField(fieldName: "modelRecommendation");
  static final ACTUALFANSPEED =
      amplify_core.QueryField(fieldName: "actualFanSpeed");
  static final ACTUALLIGHTINTENSITY =
      amplify_core.QueryField(fieldName: "actualLightIntensity");
  static final FANSTATUS = amplify_core.QueryField(fieldName: "fanStatus");
  static final FANSPEEDSETTING =
      amplify_core.QueryField(fieldName: "fanSpeedSetting");
  static final LIGHTSTATUS = amplify_core.QueryField(fieldName: "lightStatus");
  static final LIGHTINTENSITYSETTING =
      amplify_core.QueryField(fieldName: "lightIntensitySetting");
  static final WATERPUMPSTATUS =
      amplify_core.QueryField(fieldName: "waterPumpStatus");
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
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
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Microcontroller.GREENHOUSE,
        isRequired: false,
        targetNames: ['microcontrollerGreenhouseId'],
        ofModelName: 'Greenhouse'));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.TIMESTAMP,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.timestamp)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.TEMPERATURE,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.HUMIDITY,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.CO2,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.LIGHTLEVEL,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.SOILMOISTURE,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.MODELRECOMMENDATION,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.ACTUALFANSPEED,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.ACTUALLIGHTINTENSITY,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.double)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.FANSTATUS,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.FANSPEEDSETTING,
        isRequired: false,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.LIGHTSTATUS,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.LIGHTINTENSITYSETTING,
        isRequired: false,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Microcontroller.WATERPUMPSTATUS,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'createdAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));

    modelSchemaDefinition.addField(
        amplify_core.ModelFieldDefinition.nonQueryField(
            fieldName: 'updatedAt',
            isRequired: false,
            isReadOnly: true,
            ofType: amplify_core.ModelFieldType(
                amplify_core.ModelFieldTypeEnum.dateTime)));
  });
}

class _MicrocontrollerModelType
    extends amplify_core.ModelType<Microcontroller> {
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
class MicrocontrollerModelIdentifier
    implements amplify_core.ModelIdentifier<Microcontroller> {
  final String microcontrollerId;

  /** Create an instance of MicrocontrollerModelIdentifier using [microcontrollerId] the primary key. */
  const MicrocontrollerModelIdentifier({required this.microcontrollerId});

  @override
  Map<String, dynamic> serializeAsMap() =>
      (<String, dynamic>{'microcontrollerId': microcontrollerId});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() =>
      'MicrocontrollerModelIdentifier(microcontrollerId: $microcontrollerId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is MicrocontrollerModelIdentifier &&
        microcontrollerId == other.microcontrollerId;
  }

  @override
  int get hashCode => microcontrollerId.hashCode;
}
