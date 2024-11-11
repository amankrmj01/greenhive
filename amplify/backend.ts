import { defineBackend } from '@aws-amplify/backend';
import { auth } from './auth/resource';
import { data, storage } from './data/resource';

defineBackend({
  auth,
  data,
  storage,
});
