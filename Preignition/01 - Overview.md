# Preignition Overview

Machine Details:

| IP            | Name        | Difficulty | Machine Type |
| ------------- | ----------- | ---------- | ------------ |
| 10.129.11.239 | Preignition | Very Easy  | Linux        |
tags:
- gobuster
- weak credentials
- misconfiguration
## Box Outline

The server has an http service running. Enumerating with gobuster, an admin login portal was discovered. The credentials were very weak, and logging in presented the flag.