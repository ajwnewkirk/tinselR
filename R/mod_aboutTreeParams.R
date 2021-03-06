#' aboutTreeParams Function
#' 
#' @title mod_aboutTreeParams_ui mod_aboutTreeParams_server
#'
#' @description A shiny Module. This module generates the landing page which
#' describes the tree parameters that a user can adjust.
#'
#' @rdname mod_aboutTreeParams
#'
#' @param id Internal parameters for {shiny}.
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @keywords internal
#' @importFrom shiny NS tagList
mod_aboutTreeParams_ui <- function(id) {
  ns <- NS(id)
  tagList(
    fluidRow(column(12, offset = 0,
                    mainPanel(h2(strong("Description of Tree Parameters")),
                              tags$br(),
                              tags$strong("Below are defined the tree parameters
                                          that a user may adjust. Please
                                          note that these parameters are those 
                                          that are found in the package ggtree
                                          or ggplot2."),
                              tags$br(),
                              tags$br(),
                              tags$li(tags$em("Add spacing to plot -"), "This
                              will adjust the plot spacing for the tree image
                              essentially allocating more space to the plot.
                              Can be useful to adjust when adding annotations or
                                      heatmap."),
                              tags$br(),
                              tags$li(tags$em("Align the tips -"), "This will
                                      allow for tip labels to either be aligned
                                      to the right of the tree or not."),
                              tags$br(),
                              tags$li(tags$em("Annotation Label Color -"), "This
                                      will change the color of the annotation
                                      label to either 'red', 'blue',
                                      'black', or 'grey'"),
                              tags$br(),
                              tags$li(tags$em("Bootstrap Positions -"), "This
                                      will move over the bootstrap values to
                                      the left or right of the intial position."
                                      ),
                              tags$br(),
                              tags$li(tags$em("Font format -"), "This will allow
                              the font to be changed from 'bold', 'italic', or
                              'bold and italic'"),
                              tags$br(),
                              tags$li(tags$em("Heatmap Color Options -"), "This
                              will allow the color of the heatmap to be changed,
                              using the viridis color options. Options include
                              'A - magma', 'B - inferno', 'C - plasma',
                              'D - viridis', or 'E - cividis'."),
                              tags$br(),
                              tags$li(tags$em("Label for Annotation: Range -"),
                              "If nothing is adjusted here, annotations will
                              include the word range above the displayed range
                              of SNP differences. If nothing is in the text box
                              then a blank will be on the tree image above
                              the range of SNPs."),
                              tags$br(),
                              tags$li(tags$em("Label for Annotation: Median -"),
                              "If nothing is adjusted here, annotations will
                              include the word median above the displayed median
                              of SNP differences. If nothing is in the text box
                              then a blank will be on the tree image above
                              the median of SNPs."),
                              tags$br(),
                              tags$li(tags$em("Midpoint Root -"), "This will
                                      either allow the tree to be midpoint
                                      rooted or not."),
                              tags$br(),
                              tags$li(tags$em("Min. Value of Bootstrap -"), "
                                      This is the minimum value which should be
                                      displayed for bootstraps"),
                              tags$br(),
                              tags$li(tags$em("Move All Annotations -"), "This
                                      will move all annotations over. Can be
                                      useful if spacing has been adjusted for
                                      the plot."),
                              tags$br(),
                              tags$li(tags$em("Move Heatmap -"), "Adjust the
                                      position of the heatmap, this value needs
                                      to be less than the 'Add spacing to plot'
                                      parameter for the heatmap to be seen."),
                              tags$br(),
                              tags$li(tags$em("Size of Scale Bar -"), "This will
                                      convert the size of the scale bar that
                                      is displayed."),
                              tags$br(),
                              tags$li(tags$em("Tree Layout -"), "This provides
                                      the user the option for the tree layout
                                      to be either 'rectangular', 'slanted', or
                                      'circular'.")
                              )))
  )
}

#' aboutTreeParams Server Function
#'
#' @noRd
mod_aboutTreeParams_server <- function(input, output, session) {
  ns <- session$ns
}
