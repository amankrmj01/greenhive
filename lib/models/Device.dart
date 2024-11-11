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

/** This is an auto generated class representing the Device type in your schema. */
class Device extends amplify_core.Model {
  static const classType = const _DeviceModelType();
  final String? _deviceId;
  final DeviceDeviceType? _deviceType;
  final DeviceStatus? _status;
  final int? _fanSpeedSetting;
  final int? _lightIntensitySetting;
  final Microcontroller? _microcontroller;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;

  @Deprecated(
      '[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => modelIdentifier.serializeAsString();

  DeviceModelIdentifier get modelIdentifier {
    try {
      return DeviceModelIdentifier(deviceId: _deviceId!);
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  String get deviceId {
    try {
      return _deviceId!;
    } catch (e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion: amplify_core.AmplifyExceptionMessages
              .codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString());
    }
  }

  DeviceDeviceType? get deviceType {
    return _deviceType;
  }

  DeviceStatus? get status {
    return _status;
  }

  int? get fanSpeedSetting {
    return _fanSpeedSetting;
  }

  int? get lightIntensitySetting {
    return _lightIntensitySetting;
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

  const Device._internal(
      {required deviceId,
      deviceType,
      status,
      fanSpeedSetting,
      lightIntensitySetting,
      microcontroller,
      createdAt,
      updatedAt})
      : _deviceId = deviceId,
        _deviceType = deviceType,
        _status = status,
        _fanSpeedSetting = fanSpeedSetting,
        _lightIntensitySetting = lightIntensitySetting,
        _microcontroller = microcontroller,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  factory Device(
      {required String deviceId,
      DeviceDeviceType? deviceType,
      DeviceStatus? status,
      int? fanSpeedSetting,
      int? lightIntensitySetting,
      Microcontroller? microcontroller}) {
    return Device._internal(
        deviceId: deviceId,
        deviceType: deviceType,
        status: status,
        fanSpeedSetting: fanSpeedSetting,
        lightIntensitySetting: lightIntensitySetting,
        microcontroller: microcontroller);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Device &&
        _deviceId == other._deviceId &&
        _deviceType == other._deviceType &&
        _status == other._status &&
        _fanSpeedSetting == other._fanSpeedSetting &&
        _lightIntensitySetting == other._lightIntensitySetting &&
        _microcontroller == other._microcontroller;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("Device {");
    buffer.write("deviceId=" + "$_deviceId" + ", ");
    buffer.write("deviceType=" +
        (_deviceType != null
            ? amplify_core.enumToString(_deviceType)!
            : "null") +
        ", ");
    buffer.write("status=" +
        (_status != null ? amplify_core.enumToString(_status)! : "null") +
        ", ");
    buffer.write("fanSpeedSetting=" +
        (_fanSpeedSetting != null ? _fanSpeedSetting.toString() : "null") +
        ", ");
    buffer.write("lightIntensitySetting=" +
        (_lightIntensitySetting != null
            ? _lightIntensitySetting.toString()
            : "null") +
        ", ");
    buffer.write("microcontroller=" +
        (_microcontroller != null ? _microcontroller.toString() : "null") +
        ", ");
    buffer.write("createdAt=" +
        (_createdAt != null ? _createdAt.format() : "null") +
        ", ");
    buffer.write(
        "updatedAt=" + (_updatedAt != null ? _updatedAt.format() : "null"));
    buffer.write("}");

    return buffer.toString();
  }

  Device copyWith(
      {DeviceDeviceType? deviceType,
      DeviceStatus? status,
      int? fanSpeedSetting,
      int? lightIntensitySetting,
      Microcontroller? microcontroller}) {
    return Device._internal(
        deviceId: deviceId,
        deviceType: deviceType ?? this.deviceType,
        status: status ?? this.status,
        fanSpeedSetting: fanSpeedSetting ?? this.fanSpeedSetting,
        lightIntensitySetting:
            lightIntensitySetting ?? this.lightIntensitySetting,
        microcontroller: microcontroller ?? this.microcontroller);
  }

  Device copyWithModelFieldValues(
      {ModelFieldValue<DeviceDeviceType?>? deviceType,
      ModelFieldValue<DeviceStatus?>? status,
      ModelFieldValue<int?>? fanSpeedSetting,
      ModelFieldValue<int?>? lightIntensitySetting,
      ModelFieldValue<Microcontroller?>? microcontroller}) {
    return Device._internal(
        deviceId: deviceId,
        deviceType: deviceType == null ? this.deviceType : deviceType.value,
        status: status == null ? this.status : status.value,
        fanSpeedSetting: fanSpeedSetting == null
            ? this.fanSpeedSetting
            : fanSpeedSetting.value,
        lightIntensitySetting: lightIntensitySetting == null
            ? this.lightIntensitySetting
            : lightIntensitySetting.value,
        microcontroller: microcontroller == null
            ? this.microcontroller
            : microcontroller.value);
  }

  Device.fromJson(Map<String, dynamic> json)
      : _deviceId = json['deviceId'],
        _deviceType = amplify_core.enumFromString<DeviceDeviceType>(
            json['deviceType'], DeviceDeviceType.values),
        _status = amplify_core.enumFromString<DeviceStatus>(
            json['status'], DeviceStatus.values),
        _fanSpeedSetting = (json['fanSpeedSetting'] as num?)?.toInt(),
        _lightIntensitySetting =
            (json['lightIntensitySetting'] as num?)?.toInt(),
        _microcontroller = json['microcontroller'] != null
            ? json['microcontroller']['serializedData'] != null
                ? Microcontroller.fromJson(new Map<String, dynamic>.from(
                    json['microcontroller']['serializedData']))
                : Microcontroller.fromJson(
                    new Map<String, dynamic>.from(json['microcontroller']))
            : null,
        _createdAt = json['createdAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['createdAt'])
            : null,
        _updatedAt = json['updatedAt'] != null
            ? amplify_core.TemporalDateTime.fromString(json['updatedAt'])
            : null;

  Map<String, dynamic> toJson() => {
        'deviceId': _deviceId,
        'deviceType': amplify_core.enumToString(_deviceType),
        'status': amplify_core.enumToString(_status),
        'fanSpeedSetting': _fanSpeedSetting,
        'lightIntensitySetting': _lightIntensitySetting,
        'microcontroller': _microcontroller?.toJson(),
        'createdAt': _createdAt?.format(),
        'updatedAt': _updatedAt?.format()
      };

  Map<String, Object?> toMap() => {
        'deviceId': _deviceId,
        'deviceType': _deviceType,
        'status': _status,
        'fanSpeedSetting': _fanSpeedSetting,
        'lightIntensitySetting': _lightIntensitySetting,
        'microcontroller': _microcontroller,
        'createdAt': _createdAt,
        'updatedAt': _updatedAt
      };

  static final amplify_core.QueryModelIdentifier<DeviceModelIdentifier>
      MODEL_IDENTIFIER =
      amplify_core.QueryModelIdentifier<DeviceModelIdentifier>();
  static final DEVICEID = amplify_core.QueryField(fieldName: "deviceId");
  static final DEVICETYPE = amplify_core.QueryField(fieldName: "deviceType");
  static final STATUS = amplify_core.QueryField(fieldName: "status");
  static final FANSPEEDSETTING =
      amplify_core.QueryField(fieldName: "fanSpeedSetting");
  static final LIGHTINTENSITYSETTING =
      amplify_core.QueryField(fieldName: "lightIntensitySetting");
  static final MICROCONTROLLER = amplify_core.QueryField(
      fieldName: "microcontroller",
      fieldType: amplify_core.ModelFieldType(
          amplify_core.ModelFieldTypeEnum.model,
          ofModelName: 'Microcontroller'));
  static var schema = amplify_core.Model.defineSchema(
      define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Device";
    modelSchemaDefinition.pluralName = "Devices";

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
      amplify_core.ModelIndex(fields: const ["deviceId"], name: null)
    ];

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Device.DEVICEID,
        isRequired: true,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Device.DEVICETYPE,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Device.STATUS,
        isRequired: false,
        ofType: amplify_core.ModelFieldType(
            amplify_core.ModelFieldTypeEnum.enumeration)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Device.FANSPEEDSETTING,
        isRequired: false,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
        key: Device.LIGHTINTENSITYSETTING,
        isRequired: false,
        ofType:
            amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.int)));

    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.belongsTo(
        key: Device.MICROCONTROLLER,
        isRequired: false,
        targetNames: ['microcontrollerId'],
        ofModelName: 'Microcontroller'));

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

class _DeviceModelType extends amplify_core.ModelType<Device> {
  const _DeviceModelType();

  @override
  Device fromJson(Map<String, dynamic> jsonData) {
    return Device.fromJson(jsonData);
  }

  @override
  String modelName() {
    return 'Device';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Device] in your schema.
 */
class DeviceModelIdentifier implements amplify_core.ModelIdentifier<Device> {
  final String deviceId;

  /** Create an instance of DeviceModelIdentifier using [deviceId] the primary key. */
  const DeviceModelIdentifier({required this.deviceId});

  @override
  Map<String, dynamic> serializeAsMap() =>
      (<String, dynamic>{'deviceId': deviceId});

  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
      .entries
      .map((entry) => (<String, dynamic>{entry.key: entry.value}))
      .toList();

  @override
  String serializeAsString() => serializeAsMap().values.join('#');

  @override
  String toString() => 'DeviceModelIdentifier(deviceId: $deviceId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is DeviceModelIdentifier && deviceId == other.deviceId;
  }

  @override
  int get hashCode => deviceId.hashCode;
}
