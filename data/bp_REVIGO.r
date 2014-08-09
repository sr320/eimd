

# A plotting R script produced by the REVIGO server at http://revigo.irb.hr/
# If you found REVIGO useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800


# --------------------------------------------------------------------------
# If you don't have the ggplot2 package installed, uncomment the following line:
# install.packages( "ggplot2" );
library( ggplot2 );
# --------------------------------------------------------------------------
# If you don't have the scales package installed, uncomment the following line:
# install.packages( "scales" );
library( scales );


# --------------------------------------------------------------------------
# Here is your data from REVIGO. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency_%","plot_X","plot_Y","plot_size","log10_p_value","uniqueness","dispensability");
revigo.data <- rbind(c("GO:0002253","activation of immune response", 0.218, 2.570, 3.323, 4.611,-3.2343,0.474,0.000),
c("GO:0007155","cell adhesion", 0.622, 4.856,-4.953, 5.067,-1.3520,0.843,0.000),
c("GO:0022610","biological adhesion", 2.091,-0.829, 0.274, 5.593,-1.3520,0.983,0.000),
c("GO:0016311","dephosphorylation", 0.482,-3.203, 4.573, 4.956,-1.0023,0.944,0.019),
c("GO:0006793","phosphorus metabolic process",17.247,-1.580, 2.956, 6.510,-0.5656,0.945,0.068),
c("GO:0008283","cell proliferation", 0.163, 1.056,-6.336, 4.486,-0.5546,0.879,0.175),
c("GO:0007015","actin filament organization", 0.055, 5.801,-3.171, 4.015,-0.6632,0.829,0.197),
c("GO:0031396","regulation of protein ubiquitination", 0.013,-4.022,-0.083, 3.373,-2.0321,0.622,0.209),
c("GO:0000278","mitotic cell cycle", 0.115, 5.530,-4.561, 4.334,-1.2628,0.836,0.209),
c("GO:0046942","carboxylic acid transport", 1.102, 2.903,-5.680, 5.315,-0.3719,0.856,0.210),
c("GO:0051604","protein maturation", 0.265,-6.018, 2.731, 4.696,-0.9510,0.833,0.237),
c("GO:0001817","regulation of cytokine production", 0.109, 0.516,-4.007, 4.309,-1.3908,0.660,0.244),
c("GO:0006928","cellular component movement", 0.674, 4.263,-4.218, 5.101,-0.3202,0.842,0.246),
c("GO:0014073","response to tropane", 0.005, 4.520, 4.520, 2.935,-1.0054,0.785,0.250),
c("GO:0010498","proteasomal protein catabolic process", 0.047,-6.174, 0.543, 3.945,-1.2217,0.750,0.261),
c("GO:0044092","negative regulation of molecular function", 0.375,-1.970,-2.807, 4.847,-1.7311,0.703,0.263),
c("GO:0016485","protein processing", 0.252,-5.491, 3.389, 4.675,-0.6632,0.827,0.297),
c("GO:0031667","response to nutrient levels", 0.078, 5.654, 3.516, 4.166,-0.6636,0.799,0.304),
c("GO:0009617","response to bacterium", 0.117, 4.712, 4.088, 4.341,-0.5321,0.805,0.313),
c("GO:0009894","regulation of catabolic process", 0.220,-3.332,-2.666, 4.614,-0.8005,0.709,0.327),
c("GO:0006952","defense response", 0.961, 4.399, 4.736, 5.256,-1.9972,0.756,0.374),
c("GO:0006508","proteolysis", 4.002,-5.941, 2.228, 5.875,-0.5457,0.798,0.386),
c("GO:0006796","phosphate-containing compound metabolic process",17.043,-3.093, 5.124, 6.504,-0.5656,0.934,0.409),
c("GO:0006457","protein folding", 0.852,-6.168, 1.876, 5.203,-0.3585,0.787,0.443),
c("GO:0006470","protein dephosphorylation", 0.217,-5.559, 1.954, 4.609,-0.9669,0.768,0.451),
c("GO:0035556","intracellular signal transduction", 2.482, 3.210,-0.095, 5.668,-1.5963,0.526,0.483),
c("GO:0010033","response to organic substance", 0.351, 4.953, 4.221, 4.818,-0.6094,0.763,0.505),
c("GO:0006954","inflammatory response", 0.173, 4.045, 5.064, 4.510,-1.5665,0.763,0.545),
c("GO:0007243","intracellular protein kinase cascade", 0.128, 3.405, 0.675, 4.379,-0.3960,0.610,0.547),
c("GO:0009611","response to wounding", 0.223, 4.741, 4.817, 4.622,-0.9466,0.779,0.558),
c("GO:0007411","axon guidance", 0.025, 5.325, 0.392, 3.671,-0.8102,0.575,0.567),
c("GO:0042149","cellular response to glucose starvation", 0.002, 5.667, 1.942, 2.471,-0.5647,0.745,0.584),
c("GO:0051340","regulation of ligase activity", 0.004,-2.637,-3.252, 2.820,-0.7860,0.748,0.594),
c("GO:0009743","response to carbohydrate stimulus", 0.024, 5.463, 4.454, 3.655,-0.3781,0.781,0.615),
c("GO:0007264","small GTPase mediated signal transduction", 0.405, 3.391, 0.401, 4.881,-0.3972,0.580,0.615),
c("GO:0015849","organic acid transport", 1.102, 2.969,-5.950, 5.315,-0.3719,0.856,0.616),
c("GO:0051248","negative regulation of protein metabolic process", 0.209,-3.722,-0.486, 4.594,-1.8270,0.578,0.628),
c("GO:0002541","activation of plasma proteins involved in acute inflammatory response", 0.000, 0.626, 5.079, 1.690,-1.2404,0.733,0.633),
c("GO:0048568","embryonic organ development", 0.050, 1.866,-5.826, 3.973,-0.7793,0.749,0.649),
c("GO:0007186","G-protein coupled receptor signaling pathway", 0.691, 3.291, 0.135, 5.112,-0.3719,0.567,0.653),
c("GO:0030163","protein catabolic process", 0.455,-6.176, 0.829, 4.930,-0.5201,0.761,0.663),
c("GO:0022402","cell cycle process", 0.233, 4.857,-4.464, 4.641,-0.8083,0.829,0.667),
c("GO:0030855","epithelial cell differentiation", 0.033, 3.723,-4.042, 3.787,-0.3593,0.770,0.674),
c("GO:0043066","negative regulation of apoptotic process", 0.080,-0.286,-3.809, 4.176,-0.6038,0.672,0.674),
c("GO:0031397","negative regulation of protein ubiquitination", 0.004,-4.147,-0.702, 2.902,-1.6984,0.596,0.676),
c("GO:0042176","regulation of protein catabolic process", 0.029,-4.177,-0.211, 3.736,-0.5655,0.589,0.679),
c("GO:0007166","cell surface receptor signaling pathway", 1.022, 3.186, 0.008, 5.282,-0.8870,0.555,0.684),
c("GO:0002250","adaptive immune response", 0.021, 3.550, 5.374, 3.604,-0.5076,0.704,0.691),
c("GO:0050877","neurological system process", 0.399, 3.379,-5.775, 4.874,-0.3768,0.785,0.694));

one.data <- data.frame(revigo.data);
names(one.data) <- revigo.names;
one.data <- one.data [(one.data$plot_X != "null" & one.data$plot_Y != "null"), ];
one.data$plot_X <- as.numeric( as.character(one.data$plot_X) );
one.data$plot_Y <- as.numeric( as.character(one.data$plot_Y) );
one.data$plot_size <- as.numeric( as.character(one.data$plot_size) );
one.data$log10_p_value <- as.numeric( as.character(one.data$log10_p_value) );
one.data$frequency <- as.numeric( as.character(one.data$frequency) );
one.data$uniqueness <- as.numeric( as.character(one.data$uniqueness) );
one.data$dispensability <- as.numeric( as.character(one.data$dispensability) );
#head(one.data);


# --------------------------------------------------------------------------
# Names of the axes, sizes of the numbers and letters, names of the columns,
# etc. can be changed below

p1 <- ggplot( data = one.data );
p1 <- p1 + geom_point( aes( plot_X, plot_Y, colour = log10_p_value, size = plot_size), alpha = I(0.6) ) + scale_area();
p1 <- p1 + scale_colour_gradientn( colours = c("blue", "green", "yellow", "red"), limits = c( min(one.data$log10_p_value), 0) );
p1 <- p1 + geom_point( aes(plot_X, plot_Y, size = plot_size), shape = 21, fill = "transparent", colour = I (alpha ("black", 0.6) )) + scale_area();
p1 <- p1 + scale_size( range=c(5, 30)) + theme_bw(); # + scale_fill_gradientn(colours = heat_hcl(7), limits = c(-300, 0) );
ex <- one.data [ one.data$dispensability < 0.15, ]; 
p1 <- p1 + geom_text( data = ex, aes(plot_X, plot_Y, label = description), colour = I(alpha("black", 0.85)), size = 3 );
p1 <- p1 + labs (y = "semantic space x", x = "semantic space y");
p1 <- p1 + opts(legend.key = theme_blank()) ;
one.x_range = max(one.data$plot_X) - min(one.data$plot_X);
one.y_range = max(one.data$plot_Y) - min(one.data$plot_Y);
p1 <- p1 + xlim(min(one.data$plot_X)-one.x_range/10,max(one.data$plot_X)+one.x_range/10);
p1 <- p1 + ylim(min(one.data$plot_Y)-one.y_range/10,max(one.data$plot_Y)+one.y_range/10);



# --------------------------------------------------------------------------
# Output the plot to screen

p1;

# Uncomment the line below to also save the plot to a file.
# The file type depends on the extension (default=pdf).

# ggsave("C:/Users/path_to_your_file/revigo-plot.pdf");
