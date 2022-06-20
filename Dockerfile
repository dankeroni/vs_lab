# Stage 0: Compile SvelteKit Server (with node adapter)
FROM node:18 as build

WORKDIR /app

COPY ["package.json", "yarn.lock", "./"]

RUN yarn install --frozen-lockfile

COPY . .

RUN yarn build


# Stage 1: Package Server
FROM node:18

WORKDIR /app

COPY ["package.json", "yarn.lock", "./"]

RUN yarn install --production --frozen-lockfile

COPY --from=build /app/build .

EXPOSE 3000
CMD ["node", "index.js"]
