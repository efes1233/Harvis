
FROM node:22-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && rm -rf /var/lib/apt/lists/*

COPY package.json ./

RUN npm install --include=dev

COPY . .

RUN bash render-build.sh

RUN npm prune --omit=dev

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

HEALTHCHECK CMD node -e "fetch('http://localhost:'+(process.env.PORT||3000)+'/api/durum').then(r=>process.exit(r.ok?0:1)).catch(()=>process.exit(1))"

CMD ["node", "--experimental-strip-types", "--no-warnings", "server/src/index.ts"]
