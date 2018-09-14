#' Complete list of palettes
#'
#' Use \code{\link{aesthetic}} to construct palettes of desired length.
#'
#' @export
palettes <- list(
  "vaporwave" = c("#94D0FF","#8795E8","#966bff","#AD8CFF","#C774E8","#c774a9","#FF6AD5","#ff6a8b","#ff8b8b","#ffa58b","#ffde8b","#cdde8b","#8bde8b","#20de8b"),
  "cool" = c("#FF6AD5","#C774E8","#AD8CFF","#8795E8","#94D0FF"),
  "crystalpepsi" = c("#FFCCFF","#F1DAFF","#E3E8FF","#CCFFFF"),
  "mallsoft" = c("#fbcff3","#f7c0bb","#acd0f4","#8690ff","#30bfdd","#7fd4c1"),
  "jazzcup" = c("#392682","#7a3a9a","#3f86bc","#28ada8","#83dde0"),
  "sunset" = c("#661246","#ae1357","#f9247e","#d7509f","#f9897b"),
  "macplus" = c("#1b4247","#09979b","#75d8d5","#ffc0cb","#fe7f9d","#65323e"),
  "seapunk" = c("#532e57","#a997ab","#7ec488","#569874","#296656")
)

#' A vaporwave palette generator
#'
#' The color palettes are taken from https://github.com/dantaki/vapeplot
#'
#' @param n Number of colors desired.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{vaporwave}, \code{cool},  \code{crystalpepsi},
#'   \code{mallsoft}, \code{jazzcup},  \code{sunset}, \code{macplus},
#'   \code{seapunk}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' wes_palette("vaporwave")
#' wes_palette("seapunk", 3, "continuous")
aesthetic <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}


#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
