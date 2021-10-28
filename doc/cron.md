### Cron

```crontab -e```

```0 0 1 1 * script.sh``` - Every year in 1 January 00:00:00 \
```*/1 * * * * script.sh``` - Every minute\
```0 */3 * * 2,5 script.sh``` - One time per 3 hours in Tue and Fri\
```0 0,12 1 */2 * script.sh``` - At minute 0 past hour 0 and 12 on day-of-month 1 in every 2nd month
