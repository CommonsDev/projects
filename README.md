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

    sudo npm install -g bower

    sudo npm install -g coffee-script
    cd scripts
    ./coffee_watch.sh


### Launch compass

    sudo gem install compass

In the static folder

    bundle install
    compass compile
    compass watch

### Run the server 

In an other window :
    
    python -m SimpleHTTPServer 8080
