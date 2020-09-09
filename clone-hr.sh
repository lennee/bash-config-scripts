#!/bin/bash

# REQUIRED SCRIPT VARIABLES
USER="$1"
COHORT="$2"
FECTEAM="$3"
SDCTEAM="$4"
FEC=false
SDC=false

# FEC Helper function for getting team name is userPrompt runs
promptFECTeam() {
  echo "What is your FEC organization name (as created/entered on GitHub)?"
  read INPUT_FEC_TEAM
  FECTEAM=$INPUT_FEC_TEAM
  FEC=true
}

promptSDCTeam() {
  echo "What is your SDC organization name (as created/entered on GitHub)?"
  read INPUT_SDC_TEAM
  SDCTEAM=$INPUT_SDC_TEAM
  SDC=true
}

# Creates a function to prompt user if no options are given when script is run
promptUser() {
  # Prompt user for github handle
  echo "What is your GitHub username?"
  read INPUT_USER
  USER=$INPUT_USER

  # Prompt user for Cohort id
  echo "What is your COHORT ID? (i.e hrr47)"
  read INPUT_COHORT
  COHORT=$INPUT_COHORT

  # Prompt user on whether they have started/completed FEC
  while true; do
    read -p "Have you started or completed FEC? (y[es] / n[o])" yn
    case $yn in
        [Yy]* ) promptFECTeam; break;;
        [Nn]* ) FEC=false;;
        * ) echo "Please answer yes or no.";;
    esac
  done
  
  # Prompt user on whether they have started/completed FEC
  while true; do
    read -p "Have you started or completed SDC? (y[es] / n[o])" yn
    case $yn in
        [Yy]* ) promptSDCTeam; break;;
        [Nn]* ) SDC=false;;
        * ) echo "Please answer yes or no.";;
    esac
  done
}

# If the three required options aren't included in prompt, run promptUser
if [ $# != 4 ]; then
  promptUser
fi

# Clone helper function
clone () {
  git clone "https://github.com/$USER/$1"
}

# Shortcut for mkdir then cd
mkcd() {
  mkdir $1
  cd $1
}

# Pull Precourse Items
cd ..
mkcd Precourse
clone seip2006-javascript-koans
clone seip2006-testbuilder
clone seip2006-recursion
clone seip2006-twiddler
clone seip2006-underbar
cd ..

# Pull Week 1 Items
mkcd Week-1
clone $COHORT-recursion-review
clone $COHORT-underbar-review
cd ..

# Pull Week 2 Items
mkcd Week-2
clone $COHORT-data-structures
clone $COHORT-subclass-dance-party
clone $COHORT-beesbeesbees
clone $COHORT-6ees6ees6ees
clone $COHORT-n-queens
cd ..

# Pull Week 3 Items
mkcd Week-3
clone $COHORT-chatterbox-client
clone $COHORT-recast.ly
clone $COHORT-react-components
clone $COHORT-a-synchronous-swim
cd ..

# Pull Week 4 Elements
mkcd Week-4
clone $COHORT-sqool
clone $COHORT-promises
clone $COHORT-databases
clone $COHORT-cruddy-todo
clone $COHORT-shortly-express
cd ..

# Pull Week 5 Items
mkcd Week-5
clone $COHORT-fullstack-review
clone $COHORT-cowlist
clone $COHORT-mini-apps-1
cd ..

# Week 6 Begins Front End Capstone

# Function for cloning FEC repo using GitHub API for organzations
mkFEC () {
  mkcd front-end-capstone
  curl "https://api.github.com/orgs/$FECTEAM/repos?per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone
  cd ..
}

# If FEC is true or TEAM is not false then run mkFEC to clone org repos
if [[ FEC == true || FECTEAM != false ]]; then
  mkFEC
fi

mkSDC () {
  mkcd system-design-capstone
  curl "https://api.github.com/orgs/$SDCTEAM/repos?per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone
  cd ..
}

# If FEC is true or TEAM is not false then run mkFEC to clone org repos
if [[ SDC == true || SDCTEAM != false ]]; then
  mkSDC
fi

# Pull Self-Assessments
# Self Asssessments may need versioning for further COHORTs

mkcd Self-Assessments
clone $COHORT-self-assessment-week-00-v4r
clone $COHORT-self-assessment-week-01-v3r
clone $COHORT-self-assessment-week-02-v5r
clone $COHORT-self-assessment-week-03-v7r
clone $COHORT-self-assessment-week-04-v5r
clone $COHORT-self-assessment-week-08-v1r
clone $COHORT-self-assessment-week-09-v1r
clone $COHORT-self-assessment-week-10-v1r
cd ..

# Pull Toy Problems
clone $COHORT-toy-problems

# Pull Bonus Sprints
mkcd Bonus-Sprints
clone $COHORT-d3
clone $COHORT-recastly-redux
git clone https://github.com/hyperledger-archives/education-cryptomoji
cd ..



