install.packages("dplyr")
install.packages("httr")
library(httr)
library(dplyr)

token_req<-POST(url="https://api.sportsdatadirect.com/oauth/token", 
  body = list(grant_type="password", 
    username="<USERNAME>",
    password="<PASSWORD>"), 
  authenticate("<CLIENT_ID>","<CLIENT_SECRET>"))


data_req<-GET(url="https://api.sportsdatadirect.com/table/nfl/team_season_log", 
        add_headers(Authorization=paste("Bearer",content(token_req)$access_token), Accept="application/json"),
        query=list(season_start=2018)
    )
    
#to get other tables take a look at https://www.sportsdatadirect.com/pricing/ for a list of table names
data_req<-GET(url="https://api.sportsdatadirect.com/table/nfl/<TABLE_NAME>", 
        add_headers(Authorization=paste("Bearer",content(token_req)$access_token), Accept="application/json"),
        query=list(season_start=2018)
    )
