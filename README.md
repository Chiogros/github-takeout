# GitHub takeout
> Mirror your GitHub repositories (both public and private) in your basement.

## Usage
1. Get a [PAT](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token) which will be used to authenticate yourself in your GitHub account.
2. Download [github-mirror.sh](github-mirror.sh) and allow your user to execute it:
```sh
$ chmod u+x github-mirror.sh
```
3. Edit the script to configure these variables:
```sh
# STORAGE_PATH: where repositories should be stored on your system
# USERNAME: your GitHub username
# TOKEN: Personal Access Token (PAT)
readonly STORAGE_PATH="."
readonly USERNAME=""
readonly TOKEN=""
```
4. Try it out. Your repositories start getting cloned in the path you configured with `STORAGE_PATH`.
5. [24/7 machines only] Set up a crontab to execute it every week/month/semester.
