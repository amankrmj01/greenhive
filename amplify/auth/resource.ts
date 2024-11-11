import { defineAuth } from '@aws-amplify/backend';

/**
 * Define and configure your auth resource
 * @see https://docs.amplify.aws/gen2/build-a-backend/auth
 */
export const auth = defineAuth({
  loginWith: {
    email: true,
  },
});


import { defineAuth } from "@aws-amplify/backend";

/**
 * Define and configure your auth resource
 * @see https://docs.amplify.aws/gen2/build-a-backend/auth
 */
export const auth = defineAuth({
  loginWith: {
    email: true,
    username: true,
  },
  attributes: {
    required: ['name'],
  },
});
//
//      The  loginWith  property is used to specify the login methods that are available to users. In the first example, the  email  login method is enabled. In the second example, both the  email  and  username  login methods are enabled.
//      The  attributes  property is used to specify the attributes that are required when a user signs up. In the second example, the  name  attribute is required when a user signs up.
//      The  defineAuth  function is used to define and configure the auth resource. It takes an object as an argument with the following properties:
//
//      loginWith : An object that specifies the login methods that are available to users.
//      attributes : An object that specifies the attributes that are required when a user signs up.
//
//      You can use the  defineAuth  function to define and configure the auth resource in your Amplify project.
//      How to use the auth resource in your Amplify project
//      Once you have defined and configured the auth resource in your Amplify project, you can use it to authenticate users and manage user sessions.
//      To authenticate a user, you can use the  Auth  class from the  @aws-amplify/auth  package. The  Auth  class provides methods for signing up, signing in, signing out, and getting the current authenticated user.
//      Here's an example of how you can use the  Auth  class to sign up a new user:
