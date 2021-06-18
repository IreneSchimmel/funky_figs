#' Spectrophotography boxplot
#'
#' The spectrophoto_boxplot function makes it easier to quickly generate a boxplot on your spectrophotography data.
#'
#' Note: for the example, no actual spectophotography data was used.
#' It's just an example of what the output should look like.
#'
#' @param data the desired dataset
#' @param group the desired group
#' @param y the extinction data
#'
#' @return boxplot
#' @export
#'
#' @examples spectrophoto_boxplot(iris, iris$Species, iris$Sepal.Length)

spectrophoto_boxplot <- function(data, group, y) {
  data %>%
    ggplot(aes(x = group, y = y)) +
    geom_boxplot(aes(fill = group)) + theme_minimal() +
    labs(title = "Boxplot of the average extinction",
         subtitle = "per group",
         x = "",
         y = "Extinction")
}
