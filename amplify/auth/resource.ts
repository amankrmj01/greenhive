import { defineAuth } from "@aws-amplify/backend";

export const auth = defineAuth({
  loginWith: {
    email: true,
  },
//   userAttributes: {
//     email:{mutable:false,required:true},
//     preferred_username:{mutable:true,required:true},
//   },
});
