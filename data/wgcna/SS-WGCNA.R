
#if doing for first time ..

#source("http://bioconductor.org/biocLite.R") 
#biocLite("impute") 
#install.packages("WGCNA")


##NOTE you will need to change the file location

library(WGCNA);
# The following setting is important, do not omit.
options(stringsAsFactors = FALSE);
#Read in the seastar data set
SSData = read.csv("/Users/sr320/Dropbox/Steven/eimd/data/wgcna/Phel_rnaseq_normalized_expression.csv");
# Take a quick look at what is in the data set:
dim(SSData);
names(SSData);


#This tells the library where data is 
datExpr0 = as.data.frame(t(SSData[c(2:7)]));
names(datExpr0) = SSData$Contig;
rownames(datExpr0) = names(SSData)[c(2:7)];

#this command just shows data
datExpr0

#simply change the name
datExpr=datExpr0

#check data, makes sure there is no zeros
gsg = goodSamplesGenes(datExpr0, verbose = 3);
gsg$allOK
collectGarbage();

#find soft thresholding power...sr
powers = c(c(1:10), seq(from = 12, to=20, by=2))
# Call the network topology analysis function
sft = pickSoftThreshold(datExpr, powerVector = powers, verbose = 5)
# Plot the results:
sizeGrWindow(9, 5)
par(mfrow = c(1,2));
cex1 = 0.9;
# Scale-free topology fit index as a function of the soft-thresholding power
plot(sft$fitIndices[,1], -sign(sft$fitIndices[,3])*sft$fitIndices[,2],
xlab="Soft Threshold (power)",ylab="Scale Free Topology Model Fit,signed R^2",type="n",
main = paste("Scale independence"));
text(sft$fitIndices[,1], -sign(sft$fitIndices[,3])*sft$fitIndices[,2],
labels=powers,cex=cex1,col="red");
# this line corresponds to using an R^2 cut-off of h
abline(h=0.90,col="red")
# Mean connectivity as a function of the soft-thresholding power
plot(sft$fitIndices[,1], sft$fitIndices[,5],
xlab="Soft Threshold (power)",ylab="Mean Connectivity", type="n",
main = paste("Mean connectivity"))
text(sft$fitIndices[,1], sft$fitIndices[,5], labels=powers, cex=cex1,col="red")


#set 10 based on below web site
#link http://labs.genetics.ucla.edu/horvath/CoexpressionNetwork/Rpackages/WGCNA/faq.html


net = blockwiseModules(datExpr, power = 10,
TOMType = "unsigned", minModuleSize = 9,
#change merge height to get different modules
reassignThreshold = 0, mergeCutHeight = 0.05,
numericLabels = TRUE, pamRespectsDendro = FALSE,
saveTOMs = TRUE,
saveTOMFileBase = "femaleMouseTOM",
verbose = 3)


sizeGrWindow(12, 9)
# Convert labels to colors for plotting
mergedColors = labels2colors(net$colors)
# Plot the dendrogram and the module colors underneath
plotDendroAndColors(net$dendrograms[[1]], mergedColors[net$blockGenes[[1]]],
"Module colors",
dendroLabels = FALSE, hang = 0.03,
addGuide = TRUE, guideHang = 0.05)

#creates table for counts
moduleLabels = net$colors
moduleColors = labels2colors(net$colors)
table(moduleColors)

#find out what contigs are each in each 
Genes = names(datExpr)
geneInfo = data.frame(Contig = Genes, moduleColor = moduleColors)
write.csv(geneInfo, file = "geneInfo.csv")
