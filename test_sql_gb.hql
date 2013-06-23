SELECT year(ymd), avg(price_open) FROM stocks
WHERE exchange='NASDAQ' AND symbol='AAPL'
GROUP BY year(ymd)
  HAVING avg(price_open) > 50.0;
