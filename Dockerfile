#Stage 1 - Install dependencies and build the app
FROM cirrusci/flutter:latest AS build-env

RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter pub get
# RUN flutter packages pub run build_runner build --delete-conflicting-outputs
RUN flutter build web

# Stage 2 - Create the run-time image
FROM nginx:1.21.1-alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d