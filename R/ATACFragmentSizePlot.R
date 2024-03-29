#' Fragment size distribution plot for scATAC-seq analysis
#'
#' Generate the fragment size distribution plot for scATAC-seq quality control analysis.
#'
#' @docType methods
#' @name ATACFragmentSizePlot
#' @rdname ATACFragmentSizePlot
#'
#' @param filepath Path of the fragment size file generated by \code{MAESTRO}.
#' @param name Name for the output fragment size distribution plot.
#'
#' @author Chenfei Wang, Dongqing Sun
#'
#' @export

ATACFragmentSizePlot <- function(filepath, name)
{
  fragment_matrix <- read.table(filepath)
  png(paste0(name,"_scATAC_fragment_size.png"),width=6,height=6, res = 300, units = "in")
  D <- density(abs(fragment_matrix[abs(fragment_matrix)<=1000&abs(fragment_matrix)>0]))
  plot(D$x,D$y*D$n/1000,col="blue",lwd=2,type="l",main=name,xlab="Fragment size",ylab="Fragment numbers (K)")
  dev.off()
}