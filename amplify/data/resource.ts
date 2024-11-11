import { type ClientSchema, a, defineData } from '@aws-amplify/backend';

const schema = a
  .schema({
    User: a // New User model
      .model({
        userId: a.id().required(),
        name: a.string(),
        greenhouses: a.hasMany('Greenhouse', 'greenhouseUserId'), // User has many Greenhouses
      })
      .identifier(['userId']),
    Greenhouse: a
      .model({
        greenhouseId: a.id().required(),
        name: a.string().required(),
        cropName: a.string(),
        cropTimePeriod: a.int(),
        isActive: a.boolean().default(true),
        greenhouseUserId: a.id(), // Connect to User
        user: a.belongsTo('User', 'userId', fields: ['greenhouseUserId']), // Belongs to User
        microcontroller: a.hasOne('Microcontroller', 'microcontrollerGreenhouseId'), // Has one microcontroller for now
      })
      .identifier(['greenhouseId']),
    Microcontroller: a // New Microcontroller model
      .model({
        microcontrollerId: a.id().required(),
        deviceId: a.string().required(),
        // ...other microcontroller fields, e.g., model, firmware version, etc.
        sensorData: a.hasMany('SensorData', 'sensorDataMicrocontrollerId'), // Microcontroller has many SensorData
        devices: a.hasMany('Device', 'deviceMicrocontrollerId'), // Microcontroller has many devices
        microcontrollerGreenhouseId: a.id(),// Connect to Greenhouse
        greenhouse: a
            .belongsTo('Greenhouse', 'greenhouseId', fields: ['microcontrollerGreenhouseId']),
      })
      .identifier(['microcontrollerId']),
    Device: a
      .model({
        deviceId: a.id().required(),
        deviceType: a.enum(['FAN', 'LIGHT', 'WATER_PUMP']).required(),
        status: a.enum(['ON', 'OFF', 'AUTO']).default('OFF'),
        fanSpeedSetting: a.int().range(0, 100),
        lightIntensitySetting: a.int().range(0, 100),
        deviceMicrocontrollerId: a.id(), //Connect to Microcontroller
        microcontroller: a.belongsTo('Microcontroller','microcontrollerId', fields: ['deviceMicrocontrollerId']),
      })
      .identifier(['deviceId']),


    SensorData: a
      .model({
        dataId: a.id().required(),
        timestamp: a.timestamp().required(),
        temperature: a.float().required(),
        humidity: a.float().required(),
        co2: a.float(),
        light: a.float(),
        soilMoisture: a.float(),
        modelRecommendation: a.customType({
          recommendedFanSpeed: a.float(),
          recommendedLightIntensity: a.float(),
          // ... other recommendations
        }),
        actualFanSpeed: a.float(),
        actualLightIntensity: a.float(),
        sensorDataMicrocontrollerId: a.id(), // Connect to Microcontroller
        microcontroller: a.belongsTo('Microcontroller', 'microcontrollerId', fields: ['sensorDataMicrocontrollerId']),

      })
      .identifier(['dataId']),


  })
  .authorization((allow) => [
    allow.owner(),
    allow.private(),
    allow.public(),
  ]);



export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'owner', // Or 'userPools' if using Cognito
    userPoolsAuthorizationMode: {       // For Cognito User Pools
      userAttributes: ['email'],
    },
  },
});


export const { User, Greenhouse, Microcontroller, Device, SensorData } = data.models;
