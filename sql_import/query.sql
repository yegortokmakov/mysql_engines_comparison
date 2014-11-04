SELECT SQL_NO_CACHE `keywords`.`word` AS keyword, count(*) AS clicks 
FROM `adclicks`
    INNER JOIN `keywords`
        ON `adclicks`.`banner_id` = `keywords`.`banner_id` 
    LEFT JOIN `users`
        ON `users`.`id` = `adclicks`.`user_id` 
    LEFT JOIN `pageviews`
        ON `pageviews`.`id` = `adclicks`.`pageview_id` 
WHERE
    `users`.`gender` = 'F' 
    AND `users`.`age` BETWEEN 23 AND 28 
    AND `pageviews`.`platform` = 'android'
    AND `adclicks`.`created_at` BETWEEN '2014-08-20 00:00:00' AND '2014-08-31 00:00:00'
GROUP BY `keywords`.`word`
ORDER BY `clicks` DESC LIMIT 10;
