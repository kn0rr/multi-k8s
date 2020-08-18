# Build Phase section

# Tag the image with the name of the build stage (in this case the builder)
# This means that everything from this "From"-Command and everything 
# underneath it will be refered as the builder Phase till we have a 
# new From statement

#REMARK: The statement above is no longer valid because we cann't use named builders with AWS

FROM node:alpine 
WORKDIR '/app'

COPY ./package.json ./

RUN npm install

COPY . .

RUN npm run build

# Run Phase section

FROM nginx

# Following is only for AWS Elastic Beanstalk!
# Says which port should be exposed
EXPOSE 3000
#Special Configuration for AWS ends here

# Copy own nginx config
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# COPY the output from the "Builder"- phase and specifiy the folder which
# you want to copy and also specifying the directory where it should be copied to
# For nginx it must be a specific directory, see: https://hub.docker.com/_/nginx
COPY --from=0 /app/build /usr/share/nginx/html

# The default command of the nginx image will start nginx so we don't need to call that