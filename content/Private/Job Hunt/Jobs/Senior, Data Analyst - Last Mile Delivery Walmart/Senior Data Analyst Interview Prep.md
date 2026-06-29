---
created: 2026-06-23T18:23:21-05:00
modified: 2026-06-23T18:28:34-05:00
---


_When they give you a problem, immediately copy this layout with your mouse or type it block-by-block. This structure naturally handles 90% of data analyst interview questions._

SQL
![[Pasted image 20260623183515.png]]

```
SELECT 
  driver_id,
  COUNT(trip_id) AS total_trips,
  AVG(payout) AS avg_payout,
  SAFE_DIVIDE(SUM(CASE WHEN status = 'Completed' THEN 1 ELSE 0 END), COUNT(trip_id)) AS otd_rate
FROM `walmart-lmd.spark_trips.history`
WHERE trip_date >= '2026-06-01'           -- 1. Token Saver (Partition Filter)
  AND driver_status = 'Active'            -- 2. Raw Row Filter
GROUP BY driver_id                        -- 3. Groups matching the SELECT line
HAVING COUNT(trip_id) >= 10               -- 4. Filters the GROUPS (Post-math)
ORDER BY total_trips DESC                 -- 5. Sorts the output
LIMIT 100;
```

1. **`JOIN`**: Multiplies rows, **`GROUP BY`** is mandatory to collapse rows back down to count things.
2. **`WHERE` (Before Grouping):** Filters **individual rows** _before_ they are grouped.  It doesn't know what the "Total Population of Africa" is yet because it hasn't summed the numbers. Can't aggregate on a WHERE.
    
    - _Use case:_ "Show me countries with > 10 million people."
        
3. **`GROUP BY`:** Groups the filtered rows and calculates the `SUM()`. 
    
4. **`HAVING` (After Grouping):** Filters the **groups** _after_ the sum is calculated.  This is the only place you can check if a total is greater than 100 million.
    
    - _Use case:_ "Show me continents where the _total_ population is > 100 million."
### 2. BigQuery Syntax Lifelines

- **Prevent "Division by Zero" Errors:** Always use `SAFE_DIVIDE(numerator, denominator)` instead of a forward slash `/`. If the denominator is 0, BigQuery returns `NULL` instead of crashing your query live.
    
- **Handle Missing/Null Data:** `COALESCE(bonus_pay, 0)` $\rightarrow$ If `bonus_pay` is missing or null, it treats it as `0` so your additions don't break.
    
- **Bucket Dates by Week/Month:** Use `DATE_TRUNC(trip_date, MONTH)` or `DATE_TRUNC(trip_date, WEEK)`.
    

### 3. Combining Tables (The "Multiple Sources" Fix)

_Always match the shared ID key columns in the `ON` clause._

![[Pasted image 20260623182737.png]]

SQL

```
SELECT t.trip_id, d.driver_name
FROM `walmart-lmd.spark_trips.history` AS t
LEFT JOIN `walmart-lmd.spark_drivers.profiles` AS d 
  ON t.driver_id = d.driver_id;
```

- **`INNER JOIN`:** Keeps only rows where the ID exists in **both** tables.
    
- **`LEFT JOIN`:** Keeps **everything** from the first table, filling in blanks from the second table if no match exists.
    

### 4. BigQuery Token-Saving Verbal Anchors

_If they ask how you optimize queries for cost or scale, drop these exact phrases:_

1. _"I always avoid `SELECT *` because BigQuery uses columnar storage; explicitly naming columns drastically limits data scanning tokens."_
    
2. _"I look for the date partition column to filter the rows early in the `WHERE` clause before performing any heavy aggregations."_

## The Secret to Live Coding: Narrate Your Logic First

If you get stuck on the exact syntax, the worst thing you can do is freeze and stare at the screen in silence. The absolute best thing you can do is treat the panel like your future teammates and talk through your logical blueprint before typing a single character.

Try using this exact verbal framework if a prompt makes you nervous:

1. **Acknowledge the Business Goal:** _"Okay, so we want to find our most efficient Spark drivers from this past month. That means we need to look at total trips and their on-time rate."_
    
2. **State Your Strategy (Show off your Token-Saving knowledge):** _"Before I write any math, I want to make sure I'm saving BigQuery token usage. I know our logistics tables are massive, so I'm going to immediately filter by a date partition in the `WHERE` clause so we don't scan the whole history."_
    
3. **Draft the Structure (Use your screen notes):** _"Logically, I need to group this raw data by the individual `driver_id`, calculate the average delivery time, and then use a `HAVING` clause to filter out anyone who has done fewer than 10 trips so our sample size is accurate."_
    
4. **Pivot gracefully if syntax fails you:** If you forget a specific BigQuery function name live, just say: _"I don't recall the exact name of the BigQuery function to format this timestamp off the top of my head, so I'm just going to write a placeholder function name here, but logically what it's doing is pulling the day of the week so we can aggregate it."_

## Part B: The Best Practice Resources

Given your 1-hour time budget, skip generic platforms. Use these targeted paths:

- **Interview Query ([interviewquery.com/p/sql-questions-data-analyst](https://www.google.com/search?q=https%3A%2F%2Finterviewquery.com%2Fp%2Fsql-questions-data-analyst)):** Specifically read through the data analyst scenarios here to see how retail/delivery problems map to standard schemas.
    
- **SQLZoo (sqlzoo.net):** Do not click around. Go directly to **Section 0 (SELECT basics)** and **Section 5 (SUM and COUNT)**. These allow you to type queries live in the browser and fix your errors instantly.
    
- **Google Cloud BigQuery Sandbox (console.cloud.google.com):** Log in with any personal Gmail account. It gives you free access to real public datasets (like transit or commerce tables) without requiring a credit card, letting you touch the interface they will be using.
    

## Part C: The Streamlined 6-Day Study Plan (1 Hour/Day)

```
┌─────────────────────────────────────────────────────────────┐
│                 REVISED 1-HOUR CRASH PATH                   │
├───────┬─────────────────────────────────────────────────────┤
│ DAY 1 │ SELECT & WHERE (Syntax fundamentals)                │
│ DAY 2 │ GROUP BY & HAVING (Aggregate calculations)          │
│ DAY 3 │ Combining Tables (INNER vs. LEFT JOIN)              │
│ DAY 4 │ BigQuery Lifelines (SAFE_DIVIDE & COALESCE)         │
│ DAY 5 │ Hands-On Sandbox (Testing code in Google's UI)      │
│ DAY 6 │ Verbal Run-Through (Typing while talking out loud)  │
└───────┴─────────────────────────────────────────────────────┘
```

- **Day 1: Get Comfortable with Filters (1 Hr)** $\rightarrow$ Complete sections 0, 1, and 2 on SQLZoo. Your sole objective is typing basic `SELECT` and `WHERE` statements from memory.
    
- **Day 2: Master the Crucial Core (1 Hr)** $\rightarrow$ Go to SQLZoo section 5 (SUM and COUNT). Practice writing queries using `GROUP BY` and `HAVING`. Look at your cheat sheet's execution order if you get stuck.
    
- **Day 3: Join Multiple Tables (1 Hr)** $\rightarrow$ Go to SQLZoo section 6 (JOIN). Practice linking two tables together using `ON tableA.id = tableB.id`.
    
- **Day 4: Guard Against Errors (1 Hr)** $\rightarrow$ Practice turning raw math into robust BigQuery expressions using `SAFE_DIVIDE` and `COALESCE` using the template format from your cheat sheet.
    
- **Day 5: Touch the BQ Environment (1 Hr)** $\rightarrow$ Open the Google BigQuery console sandbox. Type out three basic queries using their interface so the look, feel, and auto-complete behavior don't surprise you during the live call.
    
	- **Day 6: The Communication Simulation (1 Hr)** $\rightarrow$ Open a blank notepad file. Act as if the interviewer just said, _"Find the average trip distance for active drivers this month."_ Type the solution slowly while explaining out loud exactly what each line does.
		
	- ```
	  SELECT 
  driver_id,
  AVG(trip_distance) AS avg_distance
FROM `walmart-lmd.spark_drivers.profiles` AS driver
JOIN `walmart-lmd.spark_trips.history` AS trips 
  ON driver.id = trips.driver_id
WHERE trips.trip_date >= '2026-06-01'
  AND driver.status = 'Active'
GROUP BY driver_id
ORDER BY avg_distance DESC;
	  ```
