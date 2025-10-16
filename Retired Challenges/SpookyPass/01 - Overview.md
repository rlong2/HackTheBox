# SpookyPass Overview

Machine Details:

| IP  | Name       | Difficulty | Category  |
| --- | ---------- | ---------- | --------- |
| N/A | SpookyPass | Very Easy  | Reversing |

### Challenge description
All the coolest ghosts in town are going to a Haunted Houseparty - can you prove you deserve to get in?

### tags:
- strings
### status
- [ ] not started
- [ ] in progress
- [x] got flag

## Challenge Outline

There is a linux executable. When it runs, it prompts the user for a password to reveal the flag. By running `strings` on the executable, the password is revealed. Running the executable and providing the discovered password reveals the flag.