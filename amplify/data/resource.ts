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
            microcontrollerGreenhouseId: a.id(), // Foreign key to Greenhouse
            greenhouse: a.belongsTo('Greenhouse', 'microcontrollerGreenhouseId'), // Reference Greenhouse

            // Sensor Data Fields
            timestamp: a.timestamp(),
            temperature: a.float(),
            humidity: a.float(),
            co2: a.float(),
            lightLevel: a.float(),
            soilMoisture: a.float(),
            modelRecommendation: a.json(), // JSON type for complex recommendation structure
            actualFanSpeed: a.float(),
            actualLightIntensity: a.float(),

            // Device-Specific Fields
            fanStatus: a.enum(['ON', 'OFF', 'AUTO']),  // Status for fan
            fanSpeedSetting: a.integer(),              // Speed setting for fan

            lightStatus: a.enum(['ON', 'OFF', 'AUTO']),  // Status for light
            lightIntensitySetting: a.integer(),          // Intensity setting for light

            waterPumpStatus: a.enum(['ON', 'OFF', 'AUTO']), // Status for water pump
        })
        .identifier(['microcontrollerId'])
        .authorization((allow) => [allow.authenticated()]),
});

export type Schema = ClientSchema<typeof schema>;

export const data = defineData({
    schema,
    authorizationModes: {
        defaultAuthorizationMode: 'userPool',
    },
});
