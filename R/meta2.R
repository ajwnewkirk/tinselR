#' @title Example Meta 2
#'
#' This is a meta data file for tip correction for 19 isolates of Eschericia
#' coli to be used with the Newick phylogenetic tree (example tree 2) and the
#'  optional genetic distance file (example gene 2).
#'
#' @docType data
#'
#' @rdname meta2
#'
#' @usage data(meta2)
#'
#' @keywords datasets
#' @examples
#' data(meta2)
#'  #convert the column Display labels to the row name
#' meta2 <- meta2 %>% tibble::column_to_rownames(var = "Display.labels")
"meta2"
