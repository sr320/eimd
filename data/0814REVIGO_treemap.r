

# A treemap R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","freqInDbPercent","abslog10pvalue","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0002253","activation of immune response",0.218,3.2343,0.287,0.000,"activation of immune response"),
c("GO:0044092","negative regulation of molecular function",0.375,1.7311,0.517,0.263,"activation of immune response"),
c("GO:0031396","regulation of protein ubiquitination",0.013,2.0321,0.414,0.209,"activation of immune response"),
c("GO:0006952","defense response",0.961,1.9972,0.664,0.374,"activation of immune response"),
c("GO:0035556","intracellular signal transduction",2.482,1.5963,0.418,0.483,"activation of immune response"),
c("GO:0006954","inflammatory response",0.173,1.5665,0.673,0.545,"activation of immune response"),
c("GO:0051248","negative regulation of protein metabolic process",0.209,1.8270,0.415,0.628,"activation of immune response"),
c("GO:0001817","regulation of cytokine production",0.109,1.3908,0.635,0.244,"activation of immune response"),
c("GO:0031397","negative regulation of protein ubiquitination",0.004,1.6984,0.366,0.676,"activation of immune response"),
c("GO:0007155","cell adhesion",0.622,1.3520,0.841,0.000,"cell adhesion"),
c("GO:0022610","biological adhesion",2.091,1.3520,0.913,0.000,"biological adhesion"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$abslog10pvalue <- as.numeric( as.character(stuff$abslog10pvalue) );
stuff$freqInDbPercent <- as.numeric( as.character(stuff$freqInDbPercent) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
tmPlot(
	stuff,
	index = c("representative","description"),
	vSize = "abslog10pvalue",
	type = "categorical",
	vColor = "representative",
	title = "REVIGO Gene Ontology treemap",
	inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
	lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
	bg.labels = "#CCCCCCAA",     # define background color of group labels
												       # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
	position.legend = "none"
)

dev.off()
