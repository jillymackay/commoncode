# Lets say we want to run multiple tests
# Not because we're p-hacking
# Nooooo

# I owe this code to Daniel Balaz at Roslin for working out the solution. Thanks Daniel!


# These are the tests we want to run
kruskal.test(hp ~ cyl, data = mtcars)
kruskal.test(hp ~ gear, data = mtcars)
kruskal.test(disp ~ cyl, data = mtcars)
kruskal.test(disp ~ gear, data = mtcars)
kruskal.test(mpg ~ cyl, data= mtcars)
kruskal.test(mpg ~ gear, data= mtcars)



# Create a list of the variables in the order they need to be run. 
vbls <- list(response = rep(c("hp", "disp", "mpg"), each = 2),
             explanatory = rep(c("cyl", "gear"), 3))



# And then coerce the vector names to variables

all_tests <- map2(
  vbls$explanatory,
  vbls$response,
  ~kruskal.test(
    as.formula(paste(.y, "~", .x)),
    data = mtcars,
    na.action = na.omit
  )
)



# the indiviudal tests can be accessed thusly:
all_tests[[1]]

# all tests:
all_tests
