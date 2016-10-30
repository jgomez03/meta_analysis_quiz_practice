#### Meta-Analysis Quiz Practice

library(metaPsychometric)
library(tidyverse)

###example 1 - 1000 studies
##load data
ex1_meta_data <- read_csv("meta_data_ex1.csv")

##conduct meta analysis
ex1_results <- meta_bare_bones(ex1_meta_data)
print(ex1_results)
#examine funnel plot
meta_plot_funnel(ex1_results)


###example 2 - a realistic number of studies 
##load data
ex2_meta_data <- read_csv("meta_data_ex2.csv")

##conduct meta analysis
ex2_results <- meta_bare_bones(ex2_meta_data)
print(ex2_results)
#examine the funnel plot
meta_plot_funnel(ex2_results)


###example 3 - more complex data
##load data
ex3_meta_data <- read_csv("meta_data_ex3.csv")

##conduct meta analysis
ex3_results <- meta_bare_bones(ex3_meta_data)
print(ex3_results)
#overall forrest plot
meta_plot_forest(ex3_results)
#overall funnell plot
meta_plot_funnel(ex3_results)
#bound the range where study results would be non-significant
meta_plot_funnel(ex3_results, show_null_dist = TRUE)

#breakdown by country
ex3_meta_data_canada <- ex3_meta_data %>% filter(country=="Canada")
ex3_meta_data_usa <- ex3_meta_data %>% filter(country=="United States")

#Canada Analysis 
ex3_results_canada <- meta_bare_bones(ex3_meta_data_canada)
print(ex3_results_canada)
#canada forrest plot
meta_plot_forest(ex3_results_canada)

#USA Analysis
ex3_results_usa <- meta_bare_bones(ex3_meta_data_usa)
print(ex3_results_usa)
#usa forrest plot
meta_plot_forest(ex3_results_usa)

### example 4 - correct for unreliabilty 
##load data
ex4_meta_data <- read_csv("meta_data_ex4.csv")

##conduct meta-analysis
#overall anaylsis
ex4_results <- meta_corrected(ex4_meta_data)
print(ex4_results)

##run analysis by subgroup using correction
ex4_meta_data_canada <- ex4_meta_data %>% filter(country=="Canada")
ex4_meta_data_usa <- ex4_meta_data %>% filter(country=="United States")

ex4_results_canada <- meta_corrected(ex4_meta_data_canada)
print(ex4_results_canada)

ex4_results_usa <- meta_corrected(ex4_meta_data_usa)
print(ex4_results_usa)
