# Nginx Log Analyzer
A tool written in bash to analyze relevant data from Nginx-access logs. The script will parse data and extract the following information from the log:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 status codes
- Top 5 User Agents

The tool utilizes basic linux text manipulation tools to extract these data, specifically `awk`, `grep`, `sort`, `uniq`, and `head`. 

The parsing invovles printing **specific columns**, **sorting the output**, **counting the instances of certain text**, and **replacing data**. 

This project was a part of the DevOps Projects Series from roadmap.sh, specifically [Nginx Log Analyzer](https://roadmap.sh/projects/nginx-log-analyser).

## Getting Started
Follow these steps to run the tool on your local computer
1. Clone the repository
```bash
git clone https://github.com/manasyesuarthana/server-performance-stats.git
```

2. Locate the script
```bash
cd nginx-log-analyzer
ls
```

3. Give execute permissions to the script
```bash
chmod 700 nginx.-log-analyzer.sh
```

4. Execute the script with an nginx-access.log file as an argument
```bash
./nginx-log-analyzer.sh nginx-access.log
```

## Example Output
```
$ ./nginx-log-analyzer.sh nginx-access.log
###############################################################
######                NGINX Log Analyzer                 ######
###############################################################

================== NGINX LOG REPORT ==================

******** TOP 5 IP ADDRESSES WITH MOST REQUESTS ********
--> 178.128.94.113
--> 142.93.136.176
--> 138.68.248.85
--> 159.89.185.30
--> 86.134.118.70

******** TOP 5 MOST REQUESTED PATHS ********
--> /v1-health
--> /
--> /v1-me
--> /v1-list-workspaces
--> /v1-list-timezone-teams

******** TOP 5 RESPONSE STATUS CODES *******
--> 200
--> 404
--> 304
--> 400
--> 166

******** TOP 5 USER AGENTS ********
--> DigitalOcean Uptime Probe 0.22.0 (https://digitalocean.com)
--> Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36
--> Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36
--> Custom-AsyncHttpClient
--> Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36

###############################################################
######                DONE! Enjoy NGINX!                 ######
###############################################################
```

<!-- Third DevOps Project! -->