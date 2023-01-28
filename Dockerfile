FROM node:14-alpine

RUN apk add  --no-cache ffmpeg
RUN apk --no-cache add --virtual native-deps g++ gcc python3 make && npm install --quiet node-gyp -g

WORKDIR /app

COPY package.json ./
COPY yarn.lock ./
RUN yarn --ignore-scripts
COPY . .

ENV NODE_ENV=production
ENV PORT=4000

EXPOSE 4000

CMD ["node", "./index.js"]