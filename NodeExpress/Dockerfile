# Start from a Node.js 16.13.2 (LTS) image
FROM node:16.13.2
# Specify the directory inside the image in which all commands will run
WORKDIR /usr/src/app
# Copy package files and install dependencies
COPY package*.json ./
RUN npm install -g npm@8.4.0
RUN npm install
# Copy all of the app files into the image
COPY . .
# The default command to run when starting the container
CMD [ "npm", "start" ]
