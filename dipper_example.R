# Dipper example - 1st example in appendix C of 'MARK - a gentle introduction'.

# Load RMark package
library("RMark")

# Dataset (included in 'RMark' package)
data(dipper)

# View summary of the dipper data frame
summary(dipper)

# View first few lines of data frame
head(dipper)

# Simple Mark analysis. Follows function defaults
mark_ex_01 <- mark(dipper)

