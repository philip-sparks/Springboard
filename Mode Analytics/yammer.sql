-- user engagement by country
SELECT e.location,
 COUNT(DISTINCT e.user_id) AS weekly_active_users
   FROM tutorial.yammer_events e
 WHERE e.event_type = 'engagement'
   AND e.event_name = 'login'
   GROUP BY e.location

-- every week, each country's user engagement rating
SELECT DATE_TRUNC('week', e.occurred_at),
 e.location,
 COUNT(DISTINCT e.user_id) AS weekly_active_users
   FROM tutorial.yammer_events e
 WHERE e.event_type = 'engagement'
   AND e.event_name = 'login'
   GROUP BY 1, e.location

--confirm that top user engagement country is US
SELECT e.location,
COUNT(e.location) AS "active users"
FROM tutorial.yammer_events e
WHERE e.event_type = 'engagement' AND e.event_name = 'login'
GROUP BY 1
ORDER BY 2 DESC
 
-- Dip in user actions 7/28 but continues to increase
SELECT DATE_TRUNC('week', e.occurred_at),
       e.user_type AS "user types",
       COUNT(e.action) AS actions
  FROM tutorial.yammer_emails e
  GROUP BY 1, 2

-- User actions by type shows dip in user reengagement emails
  SELECT DATE_TRUNC('week', occurred_at) AS week,
       COUNT(CASE WHEN e.action = 'sent_weekly_digest' THEN e.user_id ELSE NULL END) AS weekly_emails,
       COUNT(CASE WHEN e.action = 'sent_reengagement_email' THEN e.user_id ELSE NULL END) AS reengagement_emails,
       COUNT(CASE WHEN e.action = 'email_open' THEN e.user_id ELSE NULL END) AS email_opens,
       COUNT(CASE WHEN e.action = 'email_clickthrough' THEN e.user_id ELSE NULL END) AS email_clickthroughs
  FROM tutorial.yammer_emails e
 GROUP BY 1



 -- https://modeanalytics.com/psparks/reports/f02356f6da37

