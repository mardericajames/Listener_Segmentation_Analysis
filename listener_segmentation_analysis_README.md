  
**Overview**  
This project analyzes listener behavior on a music streaming platform to identify the factors that drive progression from casual listeners to recurring and retained listeners. Using SQL, Tableau, and Excel, listener segments were created and analyzed to uncover engagement patterns and opportunities for improving retention.

**Business Problem**  
User engagement has declined by 10% year-over-year, and the business lacks visibility into the behavioral drivers of user progression across engagement levels (casual, recurring, and retained listeners), limiting the ability to improve retention and revenue growth.

**Business Question:**  
What behavioral patterns drive user progression across engagement levels?

**Business Analysis Approach**

- User segmentation  
- Behavioral correlation analysis

**Objectives**

- Identify behavioral drivers of listener progression  
- Compare engagement metrics across listener segments  
- Discover opportunities to improve retention and platform engagement  
- Provide data-driven business recommendations

**Tools Used**

- Tableau  
- MySQL  
- Excel

**Skills Demonstrated**

- Data Cleaning  
- Exploratory Data Analysis (EDA)  
- KPI Development  
- Customer Segmentation  
- Data Visualization  
- Dashboard Development  
- Business Analysis

**Repository Structure**  
dashboard/  
data/  
documentation/  
sql/  
[README.md](http://REAME.md)

**Source Data**

| Origin | Spotify Web API |
| :---- | :---- |
| Primary Source | Kaggle |
| Dataset | [https://www.kaggle.com/datasets/nabihazahid/spotify-dataset-for-churn-analysis](https://www.kaggle.com/datasets/nabihazahid/spotify-dataset-for-churn-analysis) |
| Row Count | 8,000 |
| Row Description | Each row represents an individual listener and their engagement behavior on the platform |
| Column Count | 12 |

**Platform Level KPI Results**

| Listening Time (minutes) | Songs Played Per Day | Skip Rate (%) |
| :---: | :---: | :---: |
| 154.06 | 50.12 | 0.30 |

**Segment-Level KPI Analysis**

| Segments | AVG Listening Time (minutes) | AVG Songs Played Per Day | AVG Skip Rate (%) |
| :---: | :---: | :---: | :---: |
| **Casual Listener** | 65.76 | 20.08 | 0.30 |
| **Recurring Listener** | 113.07 | 41.68 | 0.30 |
| **Retained Listener** | 191.81 | 60.82 | 0.29 |

**Segment Level Analysis**

| Segments | Listening Time (minutes) | Songs Played Per Day | Skip Rate (%) |
| :---: | :---: | :---: | :---: |
| **Casual Listener** | low | low | moderate |
| **Recurring Listener** | moderate | moderate | similar |
| **Retained Listener** | high | high | similar |

| Key Insights | Meaning |
| :---: | ----- |
| **Engagement is highly concentrated among retained listeners** | A relatively smaller portion of listeners is driving disproportionate share of activity |
| **Listener progression is driven by activity, not behavior** | Higher engagement is tied to how often users listen, not necessarily how efficiently or selectively they consume content |
| **Engagement quality remains consistent across segments** | Even highly engaged listeners skips content at similar rates as less engaged users, suggesting content satisfaction is not the primary driver of increased usage |
| **The biggest opportunity lies in converting casual listeners** | Casual listeners represent the largest gap in engagement compared to high segments. Improving progression from casual to recurring offers the greatest opportunity to increase overall platform engagement. |
| **Higher engagement does not equate to higher retention signals** | Despite higher usage, retained listeners do not demonstrate better engagement quality (via skip rate). So increased activity may not guarantee long term retention. Retention strategies should not rely solely on increasing usage but should also consider content experience and personalization |

| Recommendation | Insight | Task | Goal |
| :---: | ----- | ----- | ----- |
| I**ncrease Engagement among Casual Listeners through Onboarding & Habit Building** | Casual listeners had significantly lower activity levels | daily/weekly reminders Playlist suggestions | Move listeners from casual to recurring |
| **Encourage Consistent Listening Behavior to Drive Progression** | Engagement is driven by frequency not quality | Send listening notifications Highlight resume session/recently played  | Reinforce habit |
| **Leverage Retained Users to Maximize Engagement & Monetization** | Retained listeners drive majority of the activity | Premium features/upsell Exclusive content | Maximize value from the most engaged users |
| **Improve Content Experience to Address Engagement Quality** | Skip rate is consistent across all segments | Improve playlist personalization Enhance recommendation algorithms | Reduce skipping behavior and improve content satisfaction |
| **Create Targeted Strategies for Each Segment** | Segments behave differently in volume but not quality | Retention & habit strengthening Monetization & loyalty | Avoid one-size-fits all strategy |

**Key Takeaway**

The analysis revealed that listener progression is primarily driven by increased listening frequency and activity volume, highlighting casual listeners as the highest-impact opportunity for improving platform engagement and retention.