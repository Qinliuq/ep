#!/usr/bin/Rscript

rdata = read.csv("use_all_btu.csv")
tdata = rdata[rdata$State == "US",] # Totals
sdata = rdata[rdata$State != "US",] # Per-state

# TETCB total energy consumption
# TPOPP total population (in thousands)
tetcb = sdata[sdata$MSN == "TETCB",]
tpopp = sdata[sdata$MSN == "TPOPP",]

write.csv(tetcb[3:length(tetcb)], "tetcb.csv", row.names=F)
write.csv(tpopp[3:length(tpopp)], "tpopp.csv", row.names=F)
write.csv(tpopp[1], "states.csv", row.names=F)

# (51, with DC)
#states = nrow(tpopp)


