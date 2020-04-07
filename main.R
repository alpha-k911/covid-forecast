library(jsonlite)
library(forecast)


data = fromJSON("https://api.covid19india.org/data.json")
l = length(data$cases_time_series$totalconfirmed)
daily_total = ts(as.numeric(data$cases_time_series$totalconfirmed[30:l]), frequency=1)
autoArima_total = auto.arima(daily_total)
total_forecast = forecast(autoArima_total, h = 5)
plot.ts(total_forecast)
plot(total_forecast)
total_forecast


daily_data = ts(as.numeric(data$cases_time_series$dailyconfirmed[30:l]), frequency=1)
autoArima_daily = auto.arima(daily_data)
daily_forecast = forecast(autoArima_daily, h = 10)
plot.ts(daily_forecast)
plot(daily_forecast)
daily_forecast

