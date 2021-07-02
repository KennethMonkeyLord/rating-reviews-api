# Initializing Setup for Server

- [ ] Set up a config.js file for DB connection
    i.e:
          const poolConfig = {
            host: 'host.docker.internal',
            user: 'username',
            password: 'somepassword',
            database: 'ratingandreviews',
            port: 5432
          }
          module.exports = poolConfig;

- [ ] CD into this file's root directory and build image from dockerfile
#        docker build -t sdcServer .        #


- [ ] Stir up a docker container of the server

#        docker run -d -p 3000:3001 --name sdcServerImage sdcServer --rm       #

- [ ] Confirm running!