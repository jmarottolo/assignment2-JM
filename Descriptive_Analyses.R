setwd("/Users/jackmarottolo17/Documents/GitHub/assignment2-JM")
myData <- read.csv("/Users/jackmarottolo17/Documents/GitHub/assignment2-JM/penguins.csv")
library(dplyr)
library(ggplot2)


### SUMMARY STATISTICS BY SPECIES ###

summary_species <- myData %>%
  group_by(species) %>%
  summarise(
    mean_bill_length_mm = mean(bill_length_mm, na.rm = TRUE),
    mean_bill_depth_mm = mean(bill_depth_mm, na.rm = TRUE),
    mean_flipper_length_mm = mean(flipper_length_mm, na.rm = TRUE),
    mean_body_mass_g = mean(body_mass_g, na.rm = TRUE)
  )

# save summary table as a .csv file
write.csv(summary_species, "summary_species.csv", row.names = FALSE)

### PLOTTING BODY MASS ON BILL LENGTH BY SPECIES ###

body_mass_plot <- ggplot(myData, aes(x = bill_length_mm,
                                     y = body_mass_g,
                                     color = species)) +
  geom_point() + labs (title = "Body Mass vs. Bill Length by Species",
                       x = "Bill Length (mm)",
                       y = "Body Mass (g)") + theme_minimal()

#save the plot

ggsave("bodymass_billlength_plot.png", plot = body_mass_plot, width = 5, height = 4, dpi = 300)





