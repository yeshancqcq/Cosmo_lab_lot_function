library(png)

test_plot_data<- read.csv(file='Documents/testPlot.csv', header=TRUE, sep=",")
# Read the csv file as a data frame

for(i in 1:nrow(test_plot_data)){
  saving_dir <- paste(c("Documents/myplot", i, ".pdf"), collapse = "")
  # Build up saving directories for each of your image
  pdf(file=saving_dir, bg="transparent")
  # Begin to plot the PDF
  par(mar = c(0,0,0,0))
  plot(c(0, 10), c(0, 10), ann = F, bty = 'n', type = 'n', xaxt = 'n', yaxt = 'n')
  # Establish a coordinate system on your plot frame. E.g. 0-10 in x axis and 0-10 in y axis
  text(x = 1, y = 9, paste(test_plot_data$data1[i]), cex = 1.2, col = "black")
  text(x = 1, y = 8, paste(test_plot_data$data2[i]), cex = 1.2, col = "black")
  text(x = 1, y = 7, paste(test_plot_data$data3[i]), cex = 1.2, col = "black")
  # Plot your tests. x and y are coordinates at the upper-left cornor of your texts
  # Call your text from the data frame in the paste function
  # cex is the size, col is the color
  img <-  readPNG(toString(test_plot_data$picture[i])) 
  # Read your image from your directory
  rasterImage(img,6,6,9,9) 
  # Plot the image. Those 4 numbers are coordinates of the lower-left cornor and upper-right conor of the image
  dev.off()
  # Stop plotting
}

# If you want to make a PDF plot or any other plots with data saved somewhere else,
# you can write a function out of the for-loop 
# and then call it before the pdf function in the for-loop
# to generate that plot with ggplot2,
# and then save it into your system and note the directory,
# and then repeat the img and rasterImage functions above the dev.off()
# to add the PDF plot into your frame



