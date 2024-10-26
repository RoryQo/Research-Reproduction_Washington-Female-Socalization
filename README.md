<h2 align="center">Reproducing Research: How Daughters Affect Their Legislator Fathers’ Voting on Women’s Issues</h2> 
    

<table align="center">
  <tr>
    <td colspan="2" align="center"><strong>Table of Contents</strong></td>
  </tr>
  <tr>
    <td>1. <a href="#overview">Overview</a></td>
    <td>4. <a href="#results">Results</a></td>
  </tr>
  <tr>
    <td>2. <a href="#requirements">Requirements</a></td>
    <td>5. <a href="#conclusion">Conclusion</a></td>
  </tr>
  <tr>
    <td>3. <a href="#analysis-steps">Analysis Steps</a></td>
    <td>6. <a href="#citations">Citations</a></td>
  </tr>
</table>




### Overview
This project reproduces the results from Ebonya Washington's 2008 paper, "Female Socialization: How Daughters Affect their Legislator Father's Voting on Women's Issues," published in the *American Economic Review*, using data from the 105th congress. The study investigates whether having a daughter influences a legislator's voting behavior on women's issues.

To view the full research paper click on the link icon that follows. <a href="https://www.aeaweb.org/articles?id=10.1257/aer.98.1.311">
    <img src="https://img.icons8.com/fluency/48/000000/external-link.png" alt="Visit Document" width=20px />
</a>




### Requirements
To run this analysis, ensure you have the following R packages installed:

- `tinytex`
- `dplyr`
- `haven`
- `stargazer`
- `ggplot2`
- `lfe`
- `kableExtra`
- `RColorBrewer`

### Analysis Steps
1. **Setup**: 
   - Configure the R environment for code chunk options to ensure that all code is executed with consistent settings, such as displaying code output.

2. **Data Overview**: 
   - Analyze the initial dataset to understand its structure, including the number of observations and variables. This step involves checking for missing values and assessing the overall data quality.
   - (A full description of the data variables is available in Ebonya Washington's 2008 paper, "Female Socialization: How Daughters Affect their Legislator Father's Voting on Women's Issues")

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
   - **Model 1**
     ```math
     aauw_i = \beta_0 + \beta_1 ngirls_i + \beta_2 totchi + \epsilon_i
     ```
   - **Model 2**
     ```math
     aauw_i = \beta_0 + \beta_1 ngirls_i + \beta_2 totchi + \beta_3 female_i + \beta_4 repub_i + \epsilon_i
     ```
   - **Model 3**
     ```math
     aauw_i = \beta_0 + \beta_1 ngirls_i + \beta_2 totchi + \beta_3 female_i + \beta_4 repub_i + \beta_5 age_i + \beta_6 age_i^2 + \epsilon_i
     ```
<br>
<img src="https://github.com/RoryQo/Research-Reproduction_Washington-Female-Socalization/blob/main/Graph2.jpg?raw=true" alt="Image" width=550px/>


7. **Interpretation**: 
   - Interpret the coefficients from the regression models, focusing on how changes in the number of daughters relate to voting behavior on women's issues. This step also involves assessing the statistical significance of the results.
   - (further details in the results section)


8. **Comparative Analysis**: 
   - Investigate potential differences in the effects of having daughters on male versus female legislators. This includes estimating separate models for each group and analyzing interaction effects to determine if the influence of daughters differs based on the legislator's gender.
- Model A: Model 1
- Model B: Model 1 on women only
- Model C: Model 1 on men only
- Model D: Model 1 with the addition of $female$, $female\times ngirls$ and $female \times totchi$

<img src="https://github.com/RoryQo/Research-Reproduction_Washington-Female-Socalization/blob/main/Graph4.jpg?raw=true" alt="Image" width=550px/>


9. **Visualization**: 
   - Generate visual representations of the data and analysis results, such as bar charts and regression plots. These visualizations aid in communicating findings effectively and highlight important trends and relationships.

<img src="https://github.com/RoryQo/Research-Reproduction_Washington-Female-Socalization/blob/main/Graph3.jpg?raw=true" alt="Image" width=500px/>

### Results

- **Personal gender of the legislator on the voting score (aauw)**

   - The interaction term with the number of daughters is not significant indicating that there isn't a significantly different effect on voting behaviors between male and female legislators based on the number of daughters they have (holding all else constant. Additionally, the interaction term of total children is not significant, indicating that there is not a significantly different effect on voting score between male and female legislators based on  the total number of children(holding all else constant).  In short no evidence that there is a difference, however, legislators are a small population, so standard errors are quite high, maybe in a broader application there could be differences.

- **Age on the voting score (aauw)**
   - The coefficient for age is 0.814, indicating that on average as age increases so does aauw voting score.  This relationship however is not statistically significant even at the 90% confidence level.  The age-squared term is negative, indicating that the effect of age on AAUW score decreases the older you get.  The effect 'flips' is ~67.8 years of age.  Again the age-squared term is not significant at the 90% confidence level.


### Conclusion
This analysis seeks to replicate and extend the findings of Washington's original research by providing a detailed examination of how familial factors, specifically the presence of daughters, influence legislative behavior on women's issues.

Key insights include:

- The positive association between the number of daughters and AAUW scores suggests that legislators with daughters may be more likely to support women's issues, indicating a potential impact of personal experiences on policy decisions.
   -  This effect appears to be independent of the legislator's gender
- The analysis also reveals nuances in the effects of age and party affiliation, emphasizing the complexity of factors that shape voting behavior.
- By comparing results across male and female legislators, the study highlights potential differences in how gender influences the relationship between familial factors and legislative behavior.

Overall, the findings contribute to the broader discourse on gender and politics, suggesting that personal circumstances can play a significant role in shaping policy positions. Future research could expand on these insights by exploring applications to the wider public voter base to further understand the dynamics of female socialization to the general (voting) public.

For any questions or feedback, please feel free to reach out!

### Citations

Washington, Ebonya L. 2008. "Female Socialization: How Daughters Affect Their Legislator Fathers." American Economic Review, 98 (1): 311–32.
DOI: 10.1257/aer.98.1.311
