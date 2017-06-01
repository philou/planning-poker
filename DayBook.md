# Display histograms for the votes

## Specs

* we'd rather generate everything from the server, to avoid js
* we'd rather not use google charts which requires an access to their servers
* we'd rather use simple html and css
* Use progress bars and rotate them vertically https://stackoverflow.com/questions/9702829/how-to-make-a-vertical-html5-progress-bar-in-google-chrome
* we'd use the max votes as the max of every bar

## to do
* ~~Add scenarios~~
    * ~~write the scenario outline~~
    * ~~implement the steps (maybe not the last one depending on progress bars)~~
* ~~Compute the histograms from the vote model~~
    * ~~test and code~~
    * ~~refactor the tests to put things in common between average estimates and histograms~~
* ~~Display progress bars~~
      * ~~display empty progress bars for all vote values~~
      * ~~pass feature tests~~
* ~~Remove 'soon' from the landing page~~
* ~~style the progress bars~~
    * ~~center them~~
* update dependencies
* Fix issues
* fix dependencies version related TODOS

# Next Stories

* Garbage collect old elections and votes
* Run jasmine tests from RubyMine
* add the names of the voters to the results

# Smells
