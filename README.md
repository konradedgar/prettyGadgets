prettyGadgets
================

``` r
 (!require(devtools)) {
    install.packages("devtools")
    require(devtools)
}
install_github("konradedgar/prettyGadgets")
```

## Content

### `UK_money_format`

``` r
UK_money_format(c(9, -10, -1234765.12, NA))
# [1] "£9"   "-£10" "-£1m" NA
```
