import { type ClientSchema, a, defineData } from '@aws-amplify/backend';

const schema = a.schema({
    User: a
        .model({
            userId: a.id(),
            name: a.string(),
            email: a.email(), // Email type
            greenhouses: a.hasMany('Greenhouse', 'greenhouseUserId'), // Reference the foreign key in Greenhouse
        })
        .identifier(['userId'])
        .authorization((allow) => [allow.authenticated()]),

    Greenhouse: a
        .model({
            greenhouseId: a.id(),
            name: a.string(),
            cropName: a.string(),
            cropTimePeriod: a.integer(),
            isActive: a.boolean(),
            greenhouseUserId: a.id(), // Foreign key to User model (userId)
            user: a.belongsTo('User', 'greenhouseUserId'), // Reference User model using greenhouseUserId
            microcontroller: a.hasOne('Microcontroller', 'microcontrollerGreenhouseId'), // Foreign key to Microcontroller
        })
        .identifier(['greenhouseId'])
        .authorization((allow) => [allow.authenticated()]),

    Microcontroller: a
        .model({
            microcontrollerId: a.id(),
            deviceId: a.string(),
            sensorData: a.hasMany('SensorData', 'microcontrollerId'), // Reference the correct foreign key field in SensorData
            devices: a.hasMany('Device', 'microcontrollerId'), // Corrected foreign key to match Device's reference
            microcontrollerGreenhouseId: a.id(), // Foreign key to Greenhouse
            greenhouse: a.belongsTo('Greenhouse', 'microcontrollerGreenhouseId'), // Reference Greenhouse using microcontrollerGreenhouseId
        })
        .identifier(['microcontrollerId'])
        .authorization((allow) => [allow.authenticated()]),

    Device: a
        .model({
            deviceId: a.id(),
            deviceType: a.enum(['FAN', 'LIGHT', 'WATER_PUMP']),
            status: a.enum(['ON', 'OFF', 'AUTO']),
            fanSpeedSetting: a.integer(),
            lightIntensitySetting: a.integer(),
            microcontrollerId: a.id(), // Foreign key to Microcontroller
            microcontroller: a.belongsTo('Microcontroller', 'microcontrollerId'), // Reference Microcontroller using microcontrollerId
        })
        .identifier(['deviceId'])
        .authorization((allow) => [allow.authenticated()]),

    SensorData: a
        .model({
            dataId: a.id(),
            timestamp: a.timestamp(),
            temperature: a.float(),
            humidity: a.float(),
            co2: a.float(),
            light: a.float(),
            soilMoisture: a.float(),
            modelRecommendation: a.json(), // JSON type for complex recommendation structure
            actualFanSpeed: a.float(),
            actualLightIntensity: a.float(),
            microcontrollerId: a.id(), // Foreign key to Microcontroller
            microcontroller: a.belongsTo('Microcontroller', 'microcontrollerId'), // Reference Microcontroller using microcontrollerId
        })
        .identifier(['dataId'])
        .authorization((allow) => [allow.authenticated()]),
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
    schema,
    authorizationModes: {
        defaultAuthorizationMode: 'userPool',
    },
});
