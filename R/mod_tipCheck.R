#' tipCheck Function
#'
#' @title mod_tipCheck_ui mod_tipCheck_server
#'
#' @description A shiny Module. This module generates messages for the user
#' regarding the files uploaded and if column(s) for a heatmap is available.
#' This module contains 3 functions located in the golem_utils_server
#' file (sanity, not_coluns, and m_file_conversion).  
#' 
#'
#' @rdname mod_tipCheck
#'
#' @param id,input,output,session internal
#' @param t_file_out tree data that is read in for tip checking
#' @param tree_file_out used to confirm that file is uploaded; on/off
#' @param gene_file_out used to confirm that file is uploaded; on/off
#' @param g_file_out gene data that is read in used for tip checking
#' @param meta_file_out used to confirm that file is uploaded; on/off
#' @param m_file_out meta data that is read in used  file for tip checking
#'
#' @importFrom shiny NS tagList
#' @importFrom tibble column_to_rownames
mod_tipCheck_ui <- function(id) {
  ns <- NS(id)
  tagList(

    tags$table(width = "100%",
               tags$th("File check messages - ",
                       colspan = "3", style =
                         "font-size:20px; color:#444444;")),

    # this outputs info about if tip labels are not concordant between all
    #three files
    htmlOutput(ns("file_checking")),

    # this one will tell user if they can add a matrix to the tree
    uiOutput(ns("file_checking_mat")),

    tags$hr(style = "border-color: #99b6d8;")
  )
}

#' tipCheck Server Function
#'
#' @rdname mod_tipCheck
#'
mod_tipCheck_server <- function(input, output, session, meta_file_out,
                                m_file_out, gene_file_out, g_file_out,
                                t_file_out, tree_file_out) {
  ns <- session$ns
  
  #inputs
  #t_file_out tree data that is read in for tip checking
  #tree_file_out used to confirm that file is uploaded; on/off
  #gene_file_out used to confirm that file is uploaded; on/off
  #g_file_out gene data that is read in used for tip checking
  #meta_file_out used to confirm that file is uploaded; on/off
  #m_file_out meta data that is read in used  file for tip checking
  
  #this will render the output from the sanity function found in the
  #golem_utils_server.R file and takes in 6 reactive files -
  #tree x2, genetic distance x2, meta data x2 - one file from each three sub
  #sections just acts as a confirmation that the file has been uploaded to
  #display the user messages. The other 3 files are the ones that either
  #sanity or not_columns functions test. For whatever reason, if I used
  #t_file_out instead of tree_file_out in L 61, the user message does not
  #display. In theory is.null(t_file_out) should render the message but it does
  #not. This could be one place for improvement. Reducing the number of
  #parameters required in thh tipCheck server from 6 to 3, especially since
  #for the example data, the files are repeated in the app_server.R file.
  
  output$file_checking <- renderUI({
    ns <- session$ns

    if (is.null(tree_file_out())) {
      #returns message from uploadData - "Please import newick tree"
    } else if (is.null(gene_file_out())) {
      return(HTML(
        '<span style="color:gray">Please upload a genetic distance file</span>')
      )
    } else if (is.null(meta_file_out())) {
      return(HTML(
        '<span style="color:gray">Please upload a meta data file</span>')
      )
    } else {
      sanity(
        t_file = t_file_out(),
        g_file = g_file_out(),
        m_file = m_file_out()
      )
    }
  })

  #displays number of columns that are available for adding a heatmap to the
  #tree via a message to the user
  output$file_checking_mat <- renderUI({
    ns <- session$ns
    if (is.null(m_file_out())) {
      return(NULL)
    } else {
      validate(not_columns(m_file_conversion(m_file_out())))
    }
  })
}
