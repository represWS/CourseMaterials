#' REPORT BASED ON ROXYGEN COMMENTS

#+ setup, include = FALSE
library(knitr)
opts_chunk$set(fig.path='figure/roxygen-')

# /* set a seed */
#+ echo = FALSE 
set.seed(42) 

#' simulate x and y vector 
x <- rnorm(100)
y <- rnorm(100, mean = 2, sd = 2)
#' plot the result
#+ fig.width = 5, fig.height = 4
plot(x, y, col = floor(abs(x) + 1))