# Curling Overview

Machine Details:

| IP           | Name    | Difficulty | Machine Type |
| ------------ | ------- | ---------- | ------------ |
| 10.10.10.150 | Curling | Easy       | Linux        |

### tags:
- joomla
- cron
- php webshell
- hash dump
### status
- [ ] not started
- [ ] in progress
- [x] got user flag
- [x] got root flag
## Box Outline

The machine is running an http service powered by Joomla and an SSH service. The main page is a blog post about curling, and user `floris` has a post that has a password-like string. The attacker was able to access the Joomla login page as `floris`, who is a Joomla super user. Editing a protostar template, the attacker got a php web shell, and elevated it to a reverse shell. The `floris` user has a `password_backup` file, which was a hash dump that had been compressed multiple times. After reversing the dump and extracting, the attacker had SSH credentials for `floris`.

There are two files that `floris` can read and write that get updated each minute, `input` and `report`. By editing the contents of `input`, the attacker could read known root files and obtained the root flag.

## Bullet points
- a Curling blog powered by Joomla.
- `floris` user has a post that has a password-like string
- attacker created a password list, was able to log into Joomla as `floris`
- `floris` is a super user on  Joomla. Used the protostar template to create a php webshell
- attacker set up a reverse shell
- uncovered a `password_backup` file hash dump
- the hashdump was revered, then unzipped multiple times, revealing SSH creds for `floris`
- There is an `input` file that is being used by a root cronjob every minute, writing to a `reports`