# simpleSignal
This simple package provide colorized wrappers around standard R signals: `message()`, `warning()` and `stop()` and provide some additional ones.

This was primarily developed to increase readability of messages while running R scripts in `GNU make` environment.

### How to install:
```{r}
library("devtools")
devtools::install_github("j-moravec/simpleSignal")
```

and run:

```{r}
?signals
```

to read the documentation.
