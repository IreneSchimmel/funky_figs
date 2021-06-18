#' Spectophotography bar graph
#'
#' The spectrophoto_bar function easily gives an overview of your spectrophotography measurements, per group.
#'
#' Note: for the example, no actual spectophotography data was used.
#' It's just an example of what the output should look like.
#'
#' @param data the desired dataset
#' @param x the x-axis variable
#' @param y the y-axis variable
#'
#' @return bar graph
#' @export
#'
#' @examples spectrophoto_bar(iris, iris$Species, iris$Sepal.Length)

spectrophoto_bar <- function(data, x, y) {
  data %>%
    ggplot(aes(x = x, y = y)) +
    geom_col(aes(fill = x)) +
    theme_bw() + theme(legend.position = "none") +
    labs(title = "Bar graph of the extinctions per group",
         x = "",
         y = "Extinction")
  }
