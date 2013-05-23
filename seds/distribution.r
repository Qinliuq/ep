#!/usr/bin/Rscript

# Extract energy consumption (BTU) data.
rdata = read.csv("use_all_btu.csv")
tdata = rdata[rdata$State == "US",] # Totals
sdata = rdata[rdata$State != "US",] # Per-state

# TETCB total energy consumption
# TPOPP total population (in thousands)
tetcb = sdata[sdata$MSN == "TETCB",]
tpopp = sdata[sdata$MSN == "TPOPP",]

rownames(tetcb) = tetcb$State
rownames(tpopp) = tpopp$State

drop_rows = c("State", "MSN")

tetcb = tetcb[,!(names(tetcb) %in% drop_rows)]
tpopp = tpopp[,!(names(tpopp) %in% drop_rows)]

# Per-capita energy consumption
tecpc = tetcb / tpopp

allplots <- function (ldata) {
	gini = c()
	for (n in names(ldata)) {
		# Obtain the lorenz curve
		ydata = setNames(ldata[,n], rownames(ldata))
		ydata = ydata[0:50]
		lorenz = cumsum(sort(ydata / sum(ydata)))

		# Plot the lorenz curve
		plot(lorenz)

		# Calculate the gini coefficient
		gini = c(gini, 2 * (0.5 - sum(lorenz) / length(lorenz)))
	}

	names(gini) = names(ldata)
	plot(gini)
}

allplots(tetcb)
allplots(tecpc)
