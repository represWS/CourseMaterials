##' Customized drawing of boxplots
##'
##' Given a (well-formated) data frame and labels, this function
##' draws the boxplots the way I uusually want them in reports.
##'
##' @param df data frame with the data to plot. It contains a 
##'           column \code{by} with the grouping information to 
##'           draw the box plots (factor), a column \code{cat} with  
##'           the labelling of the samples to use for the coloring 
##'           of the points and a column \code{vals} with the values 
##'           to be plotted (numeric).
##' @param x_lab main label for x-axis. Default: empty
##' @param y_lab main label for y-axis.
##' @param title main title for figure
##' @param xlim range for x axis. Default: NULL
##' @param ylim range for y axis. Default: NULL
##' @return plot
##' ...
my_R_function <- function(df, x_lab = "", y_lab = "", title = "", 
                          x_lim = NULL, y_lim = NULL) {
  ## we will need the R package ggplot2
  require("ggplot2")
  ## check that the df has expected format
  stopifnot(c("by", "cat", "vals") %in% colnames(df))
  stopifnot(is.factor(df[, "by"]))
  stopifnot(is.numeric(df[, "vals"]))
  stopifnot(is.null(x_lim) || (length(x_lim) == 2 && is.numeric(x_lim)))
  stopifnot(is.null(y_lim) || (length(y_lim) == 2 && is.numeric(y_lim)))

  ## draw boxplots including x-jittered observations
  theme_set(theme_gray(base_size = 12))
  ggplot(data = df, aes(x = by, y = vals)) +
  geom_boxplot(outlier.size = 0) +
  geom_jitter(position = position_jitter(w = 0.2, h = 0),
  mapping = aes(colour = cat), size = 3) +
  xlab(x_lab) + ylab(paste(y_lab, "\n")) +
  ggtitle(title) +
  coord_cartesian(xlim = x_lim, ylim = y_lim) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  scale_colour_discrete(name = "")
}
