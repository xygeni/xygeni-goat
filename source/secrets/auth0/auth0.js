// pages/api/auth/[...auth0].js
import { handleAuth } from '@auth0/nextjs-auth0';
// AUTH0_SECRET='_6de40d579eae0f58c656ee785f9fd1cb17bba66fa75c8ccd4f898adee3d1ae9';
// console.log('the AUTH0_SECRET env var is set: ', !!process.env.AUTH0_SECRET);


export default handleAuth();
