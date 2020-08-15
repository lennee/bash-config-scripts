#!/bin/bash

if [ $# != 2 ]; then
  echo "Please provide username and cohort id when calling"
  echo "i.e. \"sh clone-hackreactor.sh lennee hrr47\""
  exit 1;
fi


user="$1"
cohort="$2"

clone () {
  git clone "https://github.com/$user/$1"
}

mkcd() {
  mkdir $1
  cd $1
}

# Pull Precourse Items
mkcd Precourse
clone seip2006-javascript-koans
clone seip2006-testbuilder
clone seip2006-recursion
clone seip2006-twiddler
clone seip2006-underbar
cd ..

# Pull Week 1 Items
mkcd Week-1
clone $cohort-recursion-review
clone $cohort-underbar-review
cd ..

# Pull Week 2 Items
mkcd Week-2
clone $cohort-data-structures
clone $cohort-subclass-dance-party
clone $cohort-beesbeesbees
clone $cohort-6ees6ees6ees
clone $cohort-n-queens
cd ..

# Pull Week 3 Items
mkcd Week-3
clone $cohort-chatterbox-client
clone $cohort-recast.ly
clone $cohort-react-components
clone $cohort-a-synchronous-swim
cd ..

# Pull Week 4 Elements
mkcd Week-4
clone $cohort-sqool
clone $cohort-promises
clone $cohort-databases
clone $cohort-cruddy-todo
clone $cohort-shortly-express
cd ..

# Pull Week 5 Items
mkcd Week-5
clone $cohort-fullstack-review
clone $cohort-cowlist
clone $cohort-mini-apps-1
cd ..

# Week 6 Begins Front End Capstone


mkcd front-end-capstone

#  Add your project's repos here
#  git clone https://github.com/your-org/your-repo

# This creates as sh script that will iterate through all repos in
#    your FEC folder, pulls the master and installs modules
echo "
  for Dir in *; do
    if [ -d \"\$Dir\" ]; then
      cd \"\$Dir\"
      git checkout master
      git pull origin master
      npm install
      cd ..
    fi
  done

  echo \"\"
  echo \"========================\"
  echo \"All Repos Up to Date\"
  echo \"\"
" > pullall.sh
cd ..

# Pull Self-Assessments
# Self Asssessments may need versioning for further cohorts

mkcd Self-Assessments
clone $cohort-self-assessment-week-00-v4r
clone $cohort-self-assessment-week-01-v3r
clone $cohort-self-assessment-week-02-v5r
clone $cohort-self-assessment-week-03-v7r
clone $cohort-self-assessment-week-04-v5r
cd ..

# Pull Other Projects
clone $cohort-toy-problems
clone $cohort-d3


