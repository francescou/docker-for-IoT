FROM hypriot/rpi-node:7-slim

COPY ./app/ /app/

WORKDIR /app/

RUN npm install

EXPOSE 8180

CMD ["npm", "start"] 
