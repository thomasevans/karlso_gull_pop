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

# Let's remove the first example too
rm(mark_ex_01)
cleanup(ask = FALSE)



# Re-run first example
mark_ex_01 <- mark(dipper)

# View the PIM (Parameter Index Matrices)
# Phi
PIMS(mark_ex_01, "Phi", simplified = FALSE)

# p (case sensitive! Lower-case 'p' not 'P')
PIMS(mark_ex_01, "p", simplified = FALSE)



# Adding grouping variables/ and further variables (e.g. age, sex, etc)
# This is possible, see further down for how!

# View help for 'mark' function
?mark
# many different potential arguments. E.g. for model type ('model' argument)



# 'mark' function works by sequentially calling 5 component functions:
# 1. process.data
# 2. make.design.data
# 3. make.mark.model
# 4. run.mark.model
# 5. summary.mark

# 1. process.data example (normally you would just the 'mark' function, not the
# component functions, this is for illustration only)
dipper.process <- process.data(dipper, model = "CJS",
                               begin.time = 1980,
                               time.intervals = c(1,.5,1,.75,.25,1),
                               groups = "sex")

# Resulting object is list with various components
str(dipper.process)
# Not all variables are used in all model types, therefor they are given
# null values (NULL)

# Can extact specific components
dipper.process$group.covariates

# e.g. for time intervals
dipper.process$time.intervals


# 2. make.design.data

# First re-process the dipper data
dipper.process <- process.data(dipper,
                               model = "CJS",
                               begin.time = 1980,
                               groups = "sex")

# Run make.design.data
dipper.ddl <- make.design.data(dipper.process)
# View structure
str(dipper.ddl)

# Now when 'mark' function is ran it skips the first two steps, using the
# already processed data (output from 'make.design.data') 
dipper.mark.ex.1 <- mark(dipper.process, dipper.ddl)


PIMS(dipper.mark.ex.1, "Phi", simplified = FALSE)
