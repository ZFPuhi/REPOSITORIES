# Hey there :wave:

### Sync your fork's develop branch (if front/back end repos)
To fully sync the fork that you have previously created for the desired repo on which you will be working, you have to simply navigate to it. In my example case, to access the fork I can simply
click on my Github Username on the top left side of the screen and then click on the 'diablo4trading-fe' repo that is showing on my profile.
Once you have entered the forked repository located on your Github account, you can sync it by simply clicking on the drop-down arrow next to "Sync fork".
As you can see from the screenshot below in my case I am up to date and there is nothing to sync from the Project branch.

<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-sync.png?raw=true" alt="How to properly sync your Fork">
</p>

### Using Visual Studio Code (VS Code)
The first thing that we want to do is to switch to the main forked branch, to do that you can simply open the terminal in VS Code and type in "git checkout main" which will transfer you to your 'main' branch as shown in the screenshots below. If your branch is called different such as 'master' then you have to type 'git checkout master'.

<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-sync-using-vs-code-1.png?raw=true" alt="Find your branch">
</p>
<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-sync-using-vs-code-2.png?raw=true" alt="Find your branch">
</p>

The second step is to use the upstream.
If you haven't added an upstream to the original repository (you can check with 'git remote -v'), then simply type in 'git remote add upstream https://github.com/SanctuaryTeam/diablo4trading-fe.git' in my case its the Front End repository, in yours could be the backend so simply type in the link to the git repo and press enter. After performing that you can now type in 'git fetch upstream' which should display similar result to the screenshot below where you can see how my fork is been updated, fetching all the branches and changes located in the original repository from which we forked.

<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-sync-using-vs-code-3.png?raw=true" alt="Find your branch">
</p>

Now you can perform 'git pull' using the VS Code as shown on the screenshots below, to pull all of the changes from the upstream into your forked main branch.

<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-sync-using-vs-code-4.png?raw=true" alt="Find your branch">
</p>
<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-sync-using-vs-code-5.png?raw=true" alt="Find your branch">
</p>
<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-sync-using-vs-code-6.png?raw=true" alt="Find your branch">
</p>

Once you have done that you can simply Sync the changes that your fork didn't have.

# You will want to create a develop branch on your forked repo, if not done already.
In order to create a new branch on the Forked repository, you can follow the previous steps to enter into the repository folder and afterwards simply click on the '1 branch' located right next to your 'master/main' drop-down menu as shown on the screenshot below.
<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-find-branches.png?raw=true" alt="Find your branch">
</p>

After you have clicked on the '1 branch' you will be redirected to a page where all the branches created for the repository in question, in my case I have only 1 branch 'main' so lets create a new one.

<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-see-branches.png?raw=true" alt="See all of the branches">
</p>

To do that I have to simply click on the green button "New branch" which will open the popup displayed below on the screenshot. As displayed on the screenshot the first thing that you want to perform is to name the branch, in my case I will be adding a new language so I have typed in 'feature/additional-language'. The other two options below 'Source' I am not changing as they are saying from which Repository the branch will be created and from which branch as some projects might have more than 1 branch.

<p align="center">
  <img src="https://github.com/ZFPuhi/REPOSITORIES/blob/master/Guide-D4/images/image-create-branch.png?raw=true" alt="Add new branch">
</p>