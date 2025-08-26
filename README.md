# Cyclistic-Bike-Share-Case-Study

**Author:** Danylo Karaulanov

**Date:** August 2025

--- 

## Project Overview 
Cyclistic is a bike-share company that features more than 5,800 bicycles and 600 docking stations in Chicago. The company has two main user types:
- **Annual Members**: subscription-based, frequent riders who typically use bikes for commuting.
- **Casual Riders**: pay-per-ride users, often tourists or occasional riders. 

The company`s business objective is to **grow annual memberships**, which are far more profitable and provide predictable revenue. 

The study explores how casual riders and annual members use Cyclistic bikes differently, and develops strategic recommendations to increase membership conversion.

The project was conducted as part of **data analytics case study** and demonstrates the use of real-world datasets, advanced data analysis  tools, and business intelligence methods.  

---

## Data & Methods 
- **Data Sources**:
  - Historical Cyclistic trip data that contains large datasets 35,000+ rows (2019-2020, CSV format).
  - Processed SQL outputs for aggregated metrics.
  - R scripts and visualization for exploratory analysis.
  - Tableau dashboards for stotytelling and business presentations.

 - **Methods Used**:
   - **Google Sheets/Excel**: Initial data collection, cleaning, and exploration.
   - **SQL**: Data extractio, filtering, aggregation, and cleaning.
   - **R**: Data wrangling, descriptive statistics, and static visualization.
   - **Tableau**: Interactive dashboards and visualization of key trends.

  ---

  ## Key Research Questions
  1. **Usage Differences**: How do members and casual riders differ in trip duration, time of day, and frequency?
  2. **Conversion Potential**: What factors might motivate casual riders to purchase annual memberships?
  3. **Business Impact**: Which strategies would maximaze revenue while keeping customers engaged?
  4. **Operational Efficiency**: How can insights from user behavior improve marketing, and resource allocation?

---

## Insights & Findings

### Average Trip Duration
- **Members** consistently take short, frequent trips (12-14 minutes) - suggesting commuting or routine daily usage.
- **Casual Riders** prefer longer trips (60-95 minutes) - indicating the bike usage for leisure or tourism.

### Time of Day Patterns
- **Afternoons** are peak usage for both groups (member and casual riders).
- Member riders show a **commuter patterns** (morning & evening spikes).
- Casual riders show more **leisure-driven peaks**.

### Weekday vs Weekend
- Both groups ride more during weekdays but casual riders` weekend trips are longer.

### Trip Length Distribution
- Members: the largest number of trips are short ones **(5-15 minutes)**.
- Casual riders: the largest number of trips shifted between **15-30 minutes in 2019** to **30-60 minutes in 2020**, possibly reflecting changing tourism/commuting dynamics.

### Estimated Revenue Analysis
- Members generated **~150× more revenue** than casual riders across both years.
- **2019** → Members: $20.6M vs Casual: $69K.
- **2020** → Members: $12.7M vs Casual: $145K.
- Clear evidence that **membership conversion drives financial growth**.

>**Methodology:**
> - Annual membership assumed = $150.
> - Casual trip = $3 per ride.
> - Without account IDs, a **unique combination of date + bike ID** was used as a proxy for unique riders.
> - This approach provides a rough but practical estimate.

---

## Sample Visuals 
![average_ride_duration_on_weekdays](https://github.com/DanyloKaraulanov/Cyclistic-Bike-Share-Case-Study/blob/8aa470662580ce58fb663f67016cf513c694e5cd/r_images/Average%20duration%20on%20weekdays.png)

Finding: Casual riders take significantly longer trips than members. 

---

![trip_distribution_by_user_type_and_time_of_day](https://github.com/DanyloKaraulanov/Cyclistic-Bike-Share-Case-Study/blob/8aa470662580ce58fb663f67016cf513c694e5cd/tableau_visualizations/trip_duration_by_user_type_and_time_of_day.png) 

Finding: Afternoons are peak usage for both groups, with members also spiking in mornings.

---

![estimated_revenue_by_rider_type](https://github.com/DanyloKaraulanov/Cyclistic-Bike-Share-Case-Study/blob/8aa470662580ce58fb663f67016cf513c694e5cd/tableau_visualizations/estimated_revenue_by_rider_type.png)

Finding: Annual members generate nearly all revenue.

---

## Tableau Dashboard

[Estimated Revenue by Rider Type](https://public.tableau.com/views/EstimatedRevenuebyRiderType/Sheet1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[Trip Distribution by User Type and Time of Day (2019-2020)](https://public.tableau.com/views/TripDistributionbyUserTypeandTimeofDay2019-2020/Sheet2?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---

## SQL Examples

```sql
-- Time of day clasification
SELECT 
CASE 
WHEN HOUR (start_time) BETWEEN 6 and 11 THEN 'Morning'
WHEN HOUR (start_time) BETWEEN 12 and 17 THEN 'Afternoon'
WHEN HOUR (start_time) BETWEEN 18 and 22 THEN 'Evening'
ELSE 'Night'
END AS time_of_day,
 CASE 
        WHEN user_type = 'Subscriber' THEN 'Member'
        WHEN user_type = 'Customer' THEN 'Casual'
    END AS user_type,
    COUNT(*) AS trips
    FROM trips_2019
    GROUP BY time_of_day, user_type
    ORDER BY time_of_day, user_type;
```
```sql
-- Comparison weekend vs weekday usage
SELECT  
    CASE 
        WHEN member_casual = 'member' THEN 'Member'
        WHEN member_casual = 'casual' THEN 'Casual'
    END AS user_type,
    CASE 
        WHEN DAYOFWEEK(started_at) IN (1, 7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS trips
FROM trips_2020
GROUP BY day_type, user_type
ORDER BY day_type, user_type;
```
---

## R Examples 
```r
# Descriptive analysis on ride_length
mean(all_trips_v2$ride_length)
median(all_trips_v2$ride_length)
max(all_trips_v2$ride_length)
min(all_trips_v2$ride_length)
```
```r
# Compare members and casual users
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)
```
```r
# Visualization for average duration
all_trips_v2 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")
```

---

## Recommendations
1. **Introduce Tourist Packages**: Weekly/monthly passes tailored to visitors with easy upgrade paths to full membership.
2. **Corporate Membership Programs**:
Partner with employers to provide subsidized memberships as commuting benefits.
3. **Seasonal Campaigns**: Offer discounted memberships in spring/summer when rideship peaks.
4. **Gamification & Loyalty Rewards**: Points, badgets, and free rides for frequent users to encourage retention.

---

## Reflection
This project illustrates how **data-driven insights** can guide business strategy. 
* **Strengths**:
  * Multi-tool approach (Google Sheets, SQL, R, Tableau) provided deep, layered insights.
  * Clear link between data analysis and business recommendations.
* **Limitations**:
  * No unique user ID → some assumptions required (distinct trips approximated users).
