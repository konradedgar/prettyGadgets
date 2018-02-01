#' @title UK Money Format
#'
#' @param x Numeric vector.
#'
#' @param digits Rounding in \code{abs(x) / scale}, defaults to 0.
#'
#' @details
#' \code{UK_money_format} takes numeric vector and returns character vector with
#'   of corresponding length with values reflecting common way of expressing UK currency.
#'   Consequently, 1e6 becomes £1m. This is fairly arbitrary but may
#'   be useful when applied in generating chart labels. For alternative approaches,
#'   use of suffixes and units see: \url{https://stackoverflow.com/q/28159936/1655567}.
#'
#' @return A character vector of length corresponding to the numeric vector.
#'   \code{NA} values will be represented as \code{"£NA"}.
#'
#' @import scales
#'
#' @export
#'
#' @examples
#' UK_money_format(c(9, -10, -1234765.12, NA))
#' # [1] "£9"   "-£10" "-£1m" NA
#' \dontrun{
#' UK_money_format("a")
#' # Error: is.numeric(x) is not TRUE
#' }
UK_money_format <- function(x, digits = 0) {
    stopifnot(is.numeric(x))

    f <- function(x, digits = digits) {
        if (!is.na(x)) {
            # Suffixes/div approach discussion:
            # https://stackoverflow.com/a/28160474/1655567
            scls <- c(1, 1e3, 1e6, 1e9, 1e12)
            suffixes <- c("", "K", "m", "bn", "T")
            div <- findInterval(abs(x), scls)

            paste0(intToUtf8(163),
                   round(abs(x) / scls[div], digits),
                   suffixes[div]) -> curr

            if (x < 0) {
                paste0(intToUtf8(45), curr)
            } else {
                curr
            }
        }  else {
            x
        }
    }

    vf <- Vectorize(FUN = f, "x", "digits")

    vf(x)
}
