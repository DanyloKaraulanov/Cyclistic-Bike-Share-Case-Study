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
- Casual riders: the largerst number of trips shifted between **15-30 minutes in 2019** to **30-60 minutes in 2020**, possibly reflecting changing tourism/commuting dynamics.

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
