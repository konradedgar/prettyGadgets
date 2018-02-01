context("UK_money_format")

# Length
test_that(
    "Returned object is of correct length (2).",
    expect_length(object = UK_money_format(c(1e6, 2564123.12)),
                  n = 2)
)

# Test stoping on string
test_that(
    "Function breaks on string",
    expect_error(object = UK_money_format("a"),
                 regexp = "is\\.numeric")
)

# Test converstion billion
test_that(
    "Test conversion for billion",
    expect_identical(object = UK_money_format(3564213123.12),
                     expected = "£4bn")
)