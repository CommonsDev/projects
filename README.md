Projects
========

### Geting the code 
    
    git clone https://github.com/UnissonCo/projects.git

### Updating config.js

    mkdir _public
    cp app/scripts/config.js.sample _public/js/config.js
    
  In config.js, change rest_uri with the API you use: "http://your.dataserver.host/api/v1"

### Install dependencies

    sudo apt-get install ruby-compass ruby-fssm coffeescript
    npm install
    node_modules/.bin/bower install
    
### Launch a developement server

    node_modules/.bin/brunch watch --server
    
then point your browser at `http://localhost:3333`

### Possible error :
http://stackoverflow.com/questions/6675373/bundle-command-not-found-in-linux-debian
http://stackoverflow.com/questions/7645918/require-no-such-file-to-load-mkmf-loaderror
