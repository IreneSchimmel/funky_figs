## This function creates a column graph from BLAST output such as `gi|1850346067|gb|CP054159.1|,100.000,Klebsiella michiganensis`
## Input is the path to the desired file, followed by the amount of reads required
## The Tidyverse package (version 1.3.0) is required
## If the filter error is given, please restart your session

#' Make a graph from BLAST+ output
#'
#' This function automatically generates a graph from BLAST+ input
#' This way you'll see more easily what the composition is like.
#'
#' @import dplyr
#' @import tidyverse
#' @import ggplot2
#' @import readr
#' @import purrr
#' @import stringr
#'
#' @param path Path to a BLAST+ output file
#' @param reads Amount of reads you want to filter by
#'
#' @return column graph
#' @export
blast_graph <- function(path, reads){

  ##import
  name_table <- read_csv(path, col_names = FALSE) %>% as_tibble()
  name_table <- dplyr::rename(name_table, query = X1, probability = X2, name = X3)

  ##filter words
  species_names <- name_table %>% dplyr::filter(probability >= 100.000) %>% select(name) %>% as_vector()
  species_names <- word(species_names, 1, 2) %>% as_tibble() #For only the first word; remove the ", 2"
  species_names <- dplyr::rename(species_names, name = value)

  ##filter amount reads
  species_names <- species_names %>% group_by(name) %>% count()
  species_names <- species_names %>% dplyr::filter(n >= reads)

  ##graph
  caption_factor <- paste("Probability = 100.000%, reads >=", reads)
  graph <- species_names %>%
    ggplot(aes(x = name, y = n)) +
    geom_col(aes(fill = name), show.legend = FALSE) +
    theme(axis.text.x = element_text(angle=90)) +
    labs(title = "Bar graph of the found bacteria",
         subtitle = "Amount of reads per species",
         x = "Species",
         y = "Amount of reads",
         caption = paste0(caption_factor)) +
    coord_flip() + theme_minimal()
  graph
}
