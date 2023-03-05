# Use the official Node.js 14 image as the base image
FROM node:14-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy the Strapi app files to the container
COPY . .

# Set the NODE_ENV environment variable to "production"
ENV NODE_ENV=production npm start

# Build the Strapi app for production
RUN npm run build

# Expose port 1337
EXPOSE 1337

# Start the Strapi app
CMD ["npm", "start"]

