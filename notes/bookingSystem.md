1. How booking system works row/ coulumns
2. How we can avoide double booking same seat 
3. if are using no lock system
4. user A request seat A10 
5. user B request seat A10 
6. Double booking
7. to hanlde this we use row lock system for certain period of time
8. For that we use radis which is cahcing technique
9. why we can't use db to handle, 
10. Beacuse it's not about two request for same seat it's like 100+ people booking same ticket at time
11. DB request will increase we need to check if avaliable or not
12. one more if time is completed for row lock we need to manully remove or some process we need to write for that to check db which is again performce issue

13. Radis will provide auto expiry after expiry time complete
14. once user A selects ticket we will lock that ticket fro 5 mins 
15. wait for payment to be completed after complete any how it will get remove after 5 mins, then we make db call
16. if fails after 5 minutes it get open for all others
17. this why we use radis to lock ticket
