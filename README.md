# SvelteKit Todo App

## Deploying

An example of how to deploy a full stack is shown in the docker-compose file.

The api url gets passed to the frontend through the session store.
See `src/hooks.ts` for details.

If CORS is not set up correctly on the backend, the frontend app will not work without a proxy.
I used [local-cors-proxy](https://www.npmjs.com/package/local-cors-proxy) like this: `lcp --proxyUrl http://localhost:8090`.

## Developing

Once you've created a project and installed dependencies with `yarn`, start a development server:

```bash
yarn dev

# or start the server and open the app in a new browser tab
yarn dev -- --open
```

## Building

To create a production version of your app:

```bash
yarn build
```

You can preview the production build with `yarn preview`.
