# Instructions
---
1. Clone repo
1. Open terminal window in cloned folder
1. run `chmod +x clone-hr.sh`
1. Run in either no-prompt mode or prompt mode (see below for details).

## Run Modes
---
### No prompt mode:

If you want the script to run without interupts or asking you any questions, run the following command **with all 3 options (with no brackets around the options)**:

`./clone-hr.sh [USERNAME] [COHORT] [FEC]`

#### [USERNAME]
Your GitHub username. i.e. `github.com/superNeatUsername/` then you'd replace [USERNAME] with `superNeatUsername`

#### [COHORT]
Your Cohort ID as it appears in your GitHub repos. i.e. if your Toy Problems repo is `github.com/superNeatUsername/hrr47-toy-problems`, then you'd replace [COHORT] with `hrr47`

#### [FEC]
Has multiple options/variables.

If you have not started/completed FEC or you **do not* want to clone your FEC organziational repos, then replace [FEC] with `false`

If you have started/completed FEC and you **do** want to clone your all your FEC organization's repos, you need to enter in your FEC organization name **as it was created on GitHub**.

* **Example**: If your FEC organization's repo on GitHub is `github.com/wackyTeamName` then replace [FEC] with `wackyTeamName`
* **Example**: If your FEC component's repo on GitHub is `github.com/wackyTeamName/ofCourseYouPickAnImageCarousel` then replace [FEC] with `wackyTeamName`

#### Full run command example

`./clone-hr.sh superNeatUsername hrr47 wackyTeamName`


### Prompt Mode:

If you don't enter any options or you fail to provide all options at run, the script will prompt you at each step to input the required information. If you answer "no" to the FEC question, you will not be prompted to provide an FEC organaztion name.
