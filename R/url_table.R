#' Adding an url column to your data
#'
#' url_table easily adds a column with the desired urls, per cell!
#'
#' @param dataset The desired dataset
#' @param column The desired column (dataset$column)
#' @param urls The urls you want to insert
#'
#' @import kableExtra
#'
#' @return dataset with url column
#' @export
#'
#' @examples url_table(iris, iris$Species, urls = c(rep(c("https://en.wikipedia.org/wiki/Iris_setosa"), times = 50), rep(c("https://en.wikipedia.org/wiki/Iris_versicolor"), times = 50), rep(c("https://en.wikipedia.org/wiki/Iris_virginica"), times = 50)))

url_table <- function(dataset, column, urls) {
  dataset %>%
    mutate(Links = cell_spec(column, link = urls)) %>%
  kable("html", escape = FALSE) %>%
    kable_styling("hover", full_width = F)
}
