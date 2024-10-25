## **Recreating Research: How Daughters Affect Their Legislator Fathers’ Voting on Women’s Issues**


## Table of Contents
1. [Overview](#overview)
2. [Requirements](#requirements)
3. [Analysis Steps](#analysis-steps)
4. [Conclusion](#conclusion)

## Overview
This project analyzes data from Ebonya Washington's 2008 paper, "Female Socialization: How Daughters Affect their Legislator Father's Voting on Women's Issues," published in the *American Economic Review*. The study investigates whether having a daughter influences a legislator's voting behavior on women's issues.

## Requirements
To run this analysis, ensure you have the following R packages installed:

- `tinytex`
- `dplyr`
- `haven`
- `stargazer`
- `ggplot2`
- `lfe`
- `kableExtra`
- `RColorBrewer`

## Analysis Steps
1. **Setup**: 
   - Configure the R environment for code chunk options to ensure that all code is executed with consistent settings, such as displaying code output.

2. **Data Overview**: 
   - Analyze the initial dataset to understand its structure, including the number of observations and variables. This step involves checking for missing values and assessing the overall data quality.
   - (full description of the data is available in Ebonya Washington's 2008 paper, "Female Socialization: How Daughters Affect their Legislator Father's Voting on Women's Issues")

3. **Data Cleaning**: 
   - Filter the dataset to include only observations from the 105th Congress. This step narrows down the analysis to a specific time frame that is relevant to the research question.
   - Select relevant variables for the analysis, ensuring that only those that contribute meaningfully to the study are retained. This includes variables like AAUW scores, number of daughters, political party affiliation, and others.

4. **Summary Statistics**: 
   - Generate summary statistics for the cleaned dataset. This involves calculating means, medians, standard deviations, and other descriptive statistics to provide insights into the distribution and central tendencies of key variables.

<img src="https://github.com/RoryQo/Research-Reproduction_Washington-Female-Socalization/blob/main/Graph1.jpg?raw=true" alt="Image" width=450px/>

5. **Variable Generation**: 
   - Create new variables necessary for analysis, such as binary indicators for political party affiliation and squared terms for age. This step enhances the model’s ability to capture relationships in the data effectively.

```{r encoding}
df_105$repub <- ifelse(df_105$party==2,1,0)
```

6. **Model Estimation**: 
   - Estimate several linear regression models to analyze the impact of having daughters on the legislators’ voting on women's issues. Different models are constructed to account for various factors, allowing for a comprehensive understanding of the relationships at play.
   - $$
\begin{aligned}
 \text{Model 1: }aauw_i&=\beta_0+\beta_1ngirls_i+\beta_2totchi+\epsilon_i\\
 \text{Model 2: }aauw_i&=\beta_0+\beta_1ngirls_i+\beta_2totchi+\beta_3female_i+\beta_4repub_i+\epsilon_i\\
 \text{Model 3: } aauw_i&=\beta_0+\beta_1ngirls_i+\beta_2totchi+\beta_3female_i+\beta_4repub_i+\beta_5 age_i+\beta_6 age^2_i+\epsilon_i\\
\end{aligned}
$$
<img src="https://github.com/RoryQo/Research-Reproduction_Washington-Female-Socalization/blob/main/Graph2.jpg?raw=true" alt="Image" width=500px/>


7. **Interpretation**: 
   - Interpret the coefficients from the regression models, focusing on how changes in the number of daughters relate to voting behavior on women's issues. This step also involves assessing the statistical significance of the results.
   - (Further details are in the conclusion section)

8. **Comparative Analysis**: 
   - Investigate potential differences in the effects of having daughters on male versus female legislators. This includes estimating separate models for each group and analyzing interaction effects to determine if the influence of daughters differs based on the legislator's gender.

<img src="https://github.com/RoryQo/Research-Reproduction_Washington-Female-Socalization/blob/main/Graph4.jpg?raw=true" alt="Image" width=500px/>


9. **Visualization**: 
   - Generate visual representations of the data and analysis results, such as bar charts and regression plots. These visualizations aid in communicating findings effectively and highlight important trends and relationships.

<img src="https://github.com/RoryQo/Research-Reproduction_Washington-Female-Socalization/blob/main/graph3.jpg?raw=true" alt="Image" width=450px/>


## Conclusion
This analysis seeks to replicate and extend the findings of Washington's original research by providing a detailed examination of how familial factors, specifically the presence of daughters, influence legislative behavior on women's issues.

Key insights include:

- The positive association between the number of daughters and AAUW scores suggests that legislators with daughters may be more likely to support women's issues, indicating a potential impact of personal experiences on policy decisions.
- The analysis also reveals nuances in the effects of age and party affiliation, emphasizing the complexity of factors that shape voting behavior.
- By comparing results across male and female legislators, the study highlights potential differences in how gender influences the relationship between familial factors and legislative behavior.

Overall, the findings contribute to the broader discourse on gender and politics, suggesting that personal circumstances can play a significant role in shaping policy positions. Future research could expand on these insights by exploring applications to the wider public voter base to further understand the dynamics of female socalization to the general (voting) public.

For any questions or feedback, please feel free to reach out!
