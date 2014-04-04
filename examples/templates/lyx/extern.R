## ---- plotdata ----
## Example on sparrow data (Original source Bumpus 1898.)
sparrow <- read.table(paste("http://www.ndsu.nodak.edu/ndsu/doetkott/",
                            "introsas/rawdata/bumpus.html", sep = ""),
                      skip=20, nrows=49, 
                      col.names=c("id", "total", "alar", "head", "humerus",
                          "sternum"))
sparrow <- sparrow[, -1]
boxplot(sparrow, main = "boxplot of sparrow data")

## ---- prcomp ----
## perform PCA (scale data)
pca_res <- prcomp(sparrow, scale. = TRUE)

## print 'loadings' of first 2 PCs
require("xtable")
cat("\\begin{center}\n\n")
print(xtable(pca_res$rotation[, 1:2]), floating = FALSE)
cat("\\end{center}\n\n")

## look at biplot, color by dead/alive after storm
plot(pca_res$x[, 1:2], pch = "",
     main = "PC 1 and PC 2 for sparrow data\n (blue = survived, red = died)")
text(pca_res$x[, 1:2], labels = c(1:49),
     col = c(rep("blue", 21), rep("red", 28)))
abline(v = 0, lty = 2)
abline(h = 0, lty = 2)

## ---- starplot ----
## color by dead/alive after storm
stars(sparrow, labels = c(1:49), nrow = 6, key.loc = c(20, -1), 
      main = "star plot of sparrow data\n (blue = survived, red = died)", 
      draw.segment = FALSE,
      col.stars = c(rep("blue", 21), rep("red", 28)))

