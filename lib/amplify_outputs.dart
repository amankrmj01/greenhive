const amplifyConfig = r'''{
  "auth": {
    "user_pool_id": "us-east-1_JxXbsHOUj",
    "aws_region": "us-east-1",
    "user_pool_client_id": "2gtjk3vavi8i8nasb7m8htt6ut",
    "identity_pool_id": "us-east-1:99ab45d8-cb84-42f6-9fa8-3e345be19ff0",
    "mfa_methods": [],
    "standard_required_attributes": [
      "email"
    ],
    "username_attributes": [
      "email"
    ],
    "user_verification_types": [
      "email"
    ],
    "groups": [],
    "mfa_configuration": "NONE",
    "password_policy": {
      "min_length": 8,
      "require_lowercase": true,
      "require_numbers": true,
      "require_symbols": true,
      "require_uppercase": true
    },
    "unauthenticated_identities_enabled": true
  },
  "data": {
    "url": "https://uii6gggjfzfwvjr4ap5a5lzym4.appsync-api.us-east-1.amazonaws.com/graphql",
    "aws_region": "us-east-1",
    "default_authorization_type": "AMAZON_COGNITO_USER_POOLS",
    "authorization_types": [
      "AWS_IAM"
    ],
    "model_introspection": {
      "version": 1,
      "models": {
        "User": {
          "name": "User",
          "fields": {
            "userId": {
              "name": "userId",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "name": {
              "name": "name",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "email": {
              "name": "email",
              "isArray": false,
              "type": "AWSEmail",
              "isRequired": false,
              "attributes": []
            },
            "greenhouses": {
              "name": "greenhouses",
              "isArray": true,
              "type": {
                "model": "Greenhouse"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "greenhouseUserId"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Users",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "key",
              "properties": {
                "fields": [
                  "userId"
                ]
              }
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "allow": "private",
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": true,
            "primaryKeyFieldName": "userId",
            "sortKeyFieldNames": []
          }
        },
        "Greenhouse": {
          "name": "Greenhouse",
          "fields": {
            "greenhouseId": {
              "name": "greenhouseId",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "name": {
              "name": "name",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "cropName": {
              "name": "cropName",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "cropTimePeriod": {
              "name": "cropTimePeriod",
              "isArray": false,
              "type": "Int",
              "isRequired": false,
              "attributes": []
            },
            "isActive": {
              "name": "isActive",
              "isArray": false,
              "type": "Boolean",
              "isRequired": false,
              "attributes": []
            },
            "greenhouseUserId": {
              "name": "greenhouseUserId",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "user": {
              "name": "user",
              "isArray": false,
              "type": {
                "model": "User"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "greenhouseUserId"
                ]
              }
            },
            "microcontroller": {
              "name": "microcontroller",
              "isArray": false,
              "type": {
                "model": "Microcontroller"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "HAS_ONE",
                "associatedWith": [
                  "microcontrollerGreenhouseId"
                ],
                "targetNames": []
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Greenhouses",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "key",
              "properties": {
                "fields": [
                  "greenhouseId"
                ]
              }
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "allow": "private",
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": true,
            "primaryKeyFieldName": "greenhouseId",
            "sortKeyFieldNames": []
          }
        },
        "Microcontroller": {
          "name": "Microcontroller",
          "fields": {
            "microcontrollerId": {
              "name": "microcontrollerId",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "deviceId": {
              "name": "deviceId",
              "isArray": false,
              "type": "String",
              "isRequired": false,
              "attributes": []
            },
            "sensorData": {
              "name": "sensorData",
              "isArray": true,
              "type": {
                "model": "SensorData"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "microcontrollerId"
                ]
              }
            },
            "devices": {
              "name": "devices",
              "isArray": true,
              "type": {
                "model": "Device"
              },
              "isRequired": false,
              "attributes": [],
              "isArrayNullable": true,
              "association": {
                "connectionType": "HAS_MANY",
                "associatedWith": [
                  "microcontrollerId"
                ]
              }
            },
            "microcontrollerGreenhouseId": {
              "name": "microcontrollerGreenhouseId",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "greenhouse": {
              "name": "greenhouse",
              "isArray": false,
              "type": {
                "model": "Greenhouse"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "microcontrollerGreenhouseId"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Microcontrollers",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "key",
              "properties": {
                "fields": [
                  "microcontrollerId"
                ]
              }
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "allow": "private",
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": true,
            "primaryKeyFieldName": "microcontrollerId",
            "sortKeyFieldNames": []
          }
        },
        "Device": {
          "name": "Device",
          "fields": {
            "deviceId": {
              "name": "deviceId",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "deviceType": {
              "name": "deviceType",
              "isArray": false,
              "type": {
                "enum": "DeviceDeviceType"
              },
              "isRequired": false,
              "attributes": []
            },
            "status": {
              "name": "status",
              "isArray": false,
              "type": {
                "enum": "DeviceStatus"
              },
              "isRequired": false,
              "attributes": []
            },
            "fanSpeedSetting": {
              "name": "fanSpeedSetting",
              "isArray": false,
              "type": "Int",
              "isRequired": false,
              "attributes": []
            },
            "lightIntensitySetting": {
              "name": "lightIntensitySetting",
              "isArray": false,
              "type": "Int",
              "isRequired": false,
              "attributes": []
            },
            "microcontrollerId": {
              "name": "microcontrollerId",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "microcontroller": {
              "name": "microcontroller",
              "isArray": false,
              "type": {
                "model": "Microcontroller"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "microcontrollerId"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "Devices",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "key",
              "properties": {
                "fields": [
                  "deviceId"
                ]
              }
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "allow": "private",
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": true,
            "primaryKeyFieldName": "deviceId",
            "sortKeyFieldNames": []
          }
        },
        "SensorData": {
          "name": "SensorData",
          "fields": {
            "dataId": {
              "name": "dataId",
              "isArray": false,
              "type": "ID",
              "isRequired": true,
              "attributes": []
            },
            "timestamp": {
              "name": "timestamp",
              "isArray": false,
              "type": "AWSTimestamp",
              "isRequired": false,
              "attributes": []
            },
            "temperature": {
              "name": "temperature",
              "isArray": false,
              "type": "Float",
              "isRequired": false,
              "attributes": []
            },
            "humidity": {
              "name": "humidity",
              "isArray": false,
              "type": "Float",
              "isRequired": false,
              "attributes": []
            },
            "co2": {
              "name": "co2",
              "isArray": false,
              "type": "Float",
              "isRequired": false,
              "attributes": []
            },
            "light": {
              "name": "light",
              "isArray": false,
              "type": "Float",
              "isRequired": false,
              "attributes": []
            },
            "soilMoisture": {
              "name": "soilMoisture",
              "isArray": false,
              "type": "Float",
              "isRequired": false,
              "attributes": []
            },
            "modelRecommendation": {
              "name": "modelRecommendation",
              "isArray": false,
              "type": "AWSJSON",
              "isRequired": false,
              "attributes": []
            },
            "actualFanSpeed": {
              "name": "actualFanSpeed",
              "isArray": false,
              "type": "Float",
              "isRequired": false,
              "attributes": []
            },
            "actualLightIntensity": {
              "name": "actualLightIntensity",
              "isArray": false,
              "type": "Float",
              "isRequired": false,
              "attributes": []
            },
            "microcontrollerId": {
              "name": "microcontrollerId",
              "isArray": false,
              "type": "ID",
              "isRequired": false,
              "attributes": []
            },
            "microcontroller": {
              "name": "microcontroller",
              "isArray": false,
              "type": {
                "model": "Microcontroller"
              },
              "isRequired": false,
              "attributes": [],
              "association": {
                "connectionType": "BELONGS_TO",
                "targetNames": [
                  "microcontrollerId"
                ]
              }
            },
            "createdAt": {
              "name": "createdAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            },
            "updatedAt": {
              "name": "updatedAt",
              "isArray": false,
              "type": "AWSDateTime",
              "isRequired": false,
              "attributes": [],
              "isReadOnly": true
            }
          },
          "syncable": true,
          "pluralName": "SensorData",
          "attributes": [
            {
              "type": "model",
              "properties": {}
            },
            {
              "type": "key",
              "properties": {
                "fields": [
                  "dataId"
                ]
              }
            },
            {
              "type": "auth",
              "properties": {
                "rules": [
                  {
                    "allow": "private",
                    "operations": [
                      "create",
                      "update",
                      "delete",
                      "read"
                    ]
                  }
                ]
              }
            }
          ],
          "primaryKeyInfo": {
            "isCustomPrimaryKey": true,
            "primaryKeyFieldName": "dataId",
            "sortKeyFieldNames": []
          }
        }
      },
      "enums": {
        "DeviceDeviceType": {
          "name": "DeviceDeviceType",
          "values": [
            "FAN",
            "LIGHT",
            "WATER_PUMP"
          ]
        },
        "DeviceStatus": {
          "name": "DeviceStatus",
          "values": [
            "ON",
            "OFF",
            "AUTO"
          ]
        }
      },
      "nonModels": {}
    }
  },
  "version": "1.3"
}''';