require(grDevices) # for trans3d

f <- function(x, y) { ((x-20)*(1+y))/15 + y }

x <- seq(0,35,length=36)
y <- seq(0,10,length=36)

# Create data frame from all possible values of x and y.
d <- expand.grid(T=x,ws=y)
# complete it with values from f
d$wn <- f(d$T, d$ws)
# floor it to 0
d$wn[d$wn<0] <- 0


# define color palette
my.colors <- colorRampPalette( c("blue", "green", "yellow", "red"), interpolate="linear", bias=2 )(500)
# my.colors=terrain.colors(500)

# Display the graph in a window
print(wireframe(wn ~ T * ws, data=d, drape = TRUE,  col.regions = my.colors, xlab="T°C", ylab=list(label="wind speed\n(m/s)", rot=0), zlab=list(label="watering increment", rot=90), scales=list(arrows=FALSE), colorkey = list(col=my.colors),screen = list(z = -10, x = -80, y=0)))

# postscript("essai.eps", paper="a4")
# print(wireframe(wn ~ T * ws, data=d, drape = TRUE,  col.regions = my.colors, xlab="T°C", scales=list(arrows=FALSE), colorkey = list(col=my.colors),screen = list(z = -10, x = -80, y=0)))
# dev.off()

# Display the graph in a pdf file
pdf("waterNeedIncrement.pdf", paper="a4")
print(wireframe(wn ~ T * ws, data=d, drape = TRUE,  col.regions = my.colors, xlab="T°C", scales=list(arrows=FALSE), colorkey = list(col=my.colors),screen = list(z = -10, x = -80, y=0)))
dev.off()

# persp(x, y, z, theta = 30, phi = 30, expand = 0.5, col = "lightblue",ltheta = 120, shade = 0.75, ticktype = "detailed",xlab = "T", ylab = "ws", zlab = "wn")


# from http://stat.ethz.ch/R-manual/R-devel/library/graphics/html/persp.html
# (4) Surface colours corresponding to z-values

# nrz <- nrow(z)
# ncz <- ncol(z)
# # Create a function interpolating colors in the range of specified colors
# jet.colors <- colorRampPalette( c("blue", "green"), interpolate="spline" )
# # Generate the desired number of colors from this palette
# nbcol <- 100
# color <- jet.colors(nbcol)
# # Compute the z-value at the facet centres
# zfacet <- z[-1, -1] + z[-1, -ncz] + z[-nrz, -1] + z[-nrz, -ncz]
# # Recode facet z-values into color indices
# facetcol <- cut(zfacet, nbcol)
# persp(x, y, z, theta = -180, phi = 10, expand = 0.5, col = color[facetcol], ltheta = 120, shade = 0.75, ticktype = "detailed",xlab = "T", ylab = "ws", zlab = "wn")

# # require(rgl)
# # open3d()
# # persp3d(x, y, z, color=color[facetcol],ticktype = "detailed",xlab = "T", ylab = "ws", zlab = "wn")

