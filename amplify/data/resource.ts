import { type ClientSchema, a, defineData, defineStorage } from '@aws-amplify/backend';

const schema = a
  .schema({
    Greenhouse: a
      .model({
        greenhouseId: a.id().required(),
        name: a.string().required(),
        location: a.geoJsonPoint().required(),
        ownerId: a.id(),
        devices: a.hasMany('Device', 'greenhouseId'),
        sensors: a.hasMany('SensorData', 'greenhouseId'),
      })
      .identifier(['greenhouseId']),

    Device: a
      .model({
        deviceId: a.id().required(),
        greenhouseId: a.id().required(),
        deviceType: a.enum(['FAN', 'LIGHT', 'WATER_PUMP']).required(),
        status: a.enum(['ON', 'OFF', 'AUTO']).default('OFF'),
        fanSpeedSetting: a.int().range(0, 100),
        lightIntensitySetting: a.int().range(0, 100),
        greenhouse: a.belongsTo('Greenhouse', 'greenhouseId'),
      })
      .identifier(['deviceId']),

    SensorData: a
      .model({
        dataId: a.id().required(),
        greenhouseId: a.id().required(),
        timestamp: a.timestamp().required(),
        temperature: a.float().required(),
        humidity: a.float().required(),
        co2: a.float(),
        light: a.float(),
        soilMoisture: a.float(),
        modelRecommendation: a.customType({
          recommendedFanSpeed: a.float(),
          recommendedLightIntensity: a.float(),
        }),
        actualFanSpeed: a.float(),
        actualLightIntensity: a.float(),
        greenhouse: a.belongsTo('Greenhouse', 'greenhouseId'),
      })
      .identifier(['dataId']),
  })
  .authorization((allow) => [
    allow.publicApiKey(),
    allow.owner(),
    allow.authenticated(),
    allow.guest(),
  ]);

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
  schema,
  authorizationModes: {
    defaultAuthorizationMode: 'apiKey', // Or 'userPools' for Cognito
    apiKeyAuthorizationMode: {
      expiresInDays: 30,
    },
    userPoolsAuthorizationMode: {       // For Cognito User Pools
      userAttributes: ['email'],
    },
  },
});

export const storage = defineStorage({
  name: 'greenhouseStorage',  // Replace with a descriptive name
  access: (allow) => ({
    'profile-pictures/{entity_id}/*': [
      allow.guest.to(['read']),
      allow.entity('identity').to(['read', 'write', 'delete']),
    ],

    // Public read access, authenticated write - consider guest write restrictions
    'picture-submissions/*': [
      allow.authenticated.to(['read', 'write']),
      allow.guest().to(['read']),  // Only read for guests (more secure)
    ],

    'greenhouse-info/{greenhouse_id}/*': [
      allow.owner().to(['read', 'write', 'delete']),
    ],

    'sensor-data-exports/{greenhouse_id}/*': [
      allow.owner().to(['read', 'write', 'delete']),
    ],

    'greenhouse-images/{greenhouse_id}/*': [
      allow.owner().to(['read', 'write', 'delete']),
    ],
  }),
});

export const { Greenhouse, Device, SensorData } = data.models;
