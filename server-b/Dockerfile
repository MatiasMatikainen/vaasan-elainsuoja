
FROM node:18
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install || true
COPY src ./src
EXPOSE 4001
CMD ["npm","start"]
