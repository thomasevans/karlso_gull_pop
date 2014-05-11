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

# View object data structure
class(mark_ex_01)
# List with two classes, first 'mark', then the model type 'CJS'.

# Look at model output again
summary(mark_ex_01)
# Here 'P' is the re-capture probability, and 'phi' is the survival, each for
# between time steps

# To include a start year, and therefor get more meaningful labels, use
# variable 'begin.time'
mark_ex_02 <- mark(dipper, begin.time = 2002)
# This is a constant model, so all P and Phi values are the same

# View detailed information on model run
mark_ex_02


# Clean-up workspace and working directory by removing second example
# Remove mark_ex_02 object
rm(mark_ex_02)
# View files in working directory, 'mark002...' files still present
list.files()
# Use cleanup to remove 'orphaned files'
cleanup(ask = FALSE)
# Confirm that files with 'mark002...' are removed
list.files()

