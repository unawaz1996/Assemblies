ExN50 = read.table("ExN50.stats", header=T)
plot(ExN50$E, ExN50$ExN50, xlab="Total Expression (%)", ylab="Contig N50 length", col='black', pch = 18, cex = 1.65)

abline(h=1866, v= 90, col="black",  lty = 4, lwd = 2)

write(cat("ExN50 data plotted as:", pdf_filename), stderr())

quit(save = "no", status = 0, runLast = FALSE)
