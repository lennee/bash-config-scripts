# Instructions
---
1. Clone repo
1. Open terminal window in cloned folder
1. run `chmod +x clone-hr.sh`
1. Run in either no-prompt mode or prompt mode (see below for details).

##### NOTE: When the script runs, you may be asked once again for your GitHub username as well as your password. This is not the script asking for those items, it is GitHub. Your password is never saved nor read by the bash script itself and the password requirement is due to you attempting to download Hack Reactor created repos that are listed as private. GitHub needs to know you are an authorized individual and have permission to download those private repos; if you do not provide this info, the repos will not be downloaded and there is nothing that can be done about that.

## Run Modes
---
### No prompt mode:

If you want the script to run without interupts or asking you any questions, run the following command **with all 3 options (with no brackets around the options)**:

`./clone-hr.sh [USERNAME] [COHORT] [FEC] [SDC]`

#### [USERNAME]
Your GitHub username. i.e. `github.com/superNeatUsername/` then you'd replace [USERNAME] with `superNeatUsername`

#### [COHORT]
Your Cohort ID as it appears in your GitHub repos. i.e. if your Toy Problems repo is `github.com/superNeatUsername/hrr47-toy-problems`, then you'd replace [COHORT] with `hrr47`

#### [FEC] and [SDC]
Has multiple options/variables.

If you have not started/completed FEC/SDC or you **do not* want to clone your FEC/SDC organziational repos, then replace [FEC] (or [SDC]) with `false`

If you have started/completed FEC/SDC and you **do** want to clone your all your FEC/SDC organization's repos, you need to enter in your FEC/SDC organization name **as it was created on GitHub**.

* **Example**: If your FEC/SDC organization's repo on GitHub is `github.com/wackyTeamName` then replace [FEC] (or [SDC]) with `wackyTeamName`
* **Example**: If your FEC/SDC component's repo on GitHub is `github.com/wackyTeamName/ofCourseYouPickAnImageCarousel` then replace [FEC] (or [SDC]) with `wackyTeamName`

#### Full run command example

`./clone-hr.sh superNeatUsername hrr47 wackyTeamName`


### Prompt Mode:

If you don't enter any options or you fail to provide all options at run, the script will prompt you at each step to input the required information. If you answer "no" to the FEC/SDC question, you will not be prompted to provide an FEC/SDC organaztion name.
