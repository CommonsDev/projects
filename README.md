Projects
========

### Geting the code 
    mkdir projects
    
    git clone https://github.com/UnissonCo/projects.git

### Updating config.js

    cd scripts
    cp config.js.sample config.js
    
  In config.js, change rest_uri with the API you use: "http://imaginationforpeople.org/api/v1"

### Launch coffee watch

    sudo apt-get install ruby-compass ruby-fssm coffeescript
    sudo npm install -g coffee-script
    cd scripts
    ./coffee_watch.sh
    
### Launch bower

    sudo npm install -g bower
    bower install

### Launch compass

    sudo gem install compass

In the static folder

    bundle install
    compass compile
    compass watch

### Run the server 

In an other window :
    
    python -m SimpleHTTPServer 8080


### Possible error :
http://stackoverflow.com/questions/6675373/bundle-command-not-found-in-linux-debian
http://stackoverflow.com/questions/7645918/require-no-such-file-to-load-mkmf-loaderror
