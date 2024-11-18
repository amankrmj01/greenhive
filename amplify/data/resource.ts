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
            cropType: a.string(),
            description: a.string(),
            cropTimePeriod: a.integer(),
            greenhouseUserId: a.id(), // Foreign key to User model (userId)
            user: a.belongsTo('User', 'greenhouseUserId'), // Reference User model using greenhouseUserId

            // Add matching hasOne relationship for Microcontroller
            microcontroller: a.hasOne('Microcontroller', 'microcontrollerGreenhouseId'), // Reference Microcontroller
        })
        .identifier(['greenhouseId'])
        .authorization((allow) => [allow.authenticated()]),

    Microcontroller: a
        .model({
            microcontrollerId: a.id(),
            microcontrollerGreenhouseId: a.id(), // Foreign key to Greenhouse
            greenhouse: a.belongsTo('Greenhouse', 'microcontrollerGreenhouseId'), // Reference Greenhouse

            // Static fields related to the microcontroller
            microcontrollerName: a.string(),
            publishTopic: a.string(),
            subscribeTopic: a.string(),
            rootCA: a.string(),
            privateKey: a.string(),
            certificate: a.string(),
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
