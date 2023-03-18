## A parser for ESRI ASCII Raster### What is ESRI ASCIIThe ESRI ASCII raster format can be used to transfer information to or from other cell-based or raster systems. When an existing raster is output to an ESRI ASCII-format raster, the file will begin with header information that defines the properties of the raster such as the cell size, the number of rows and columns, and the coordinates of the origin of the raster. The header information is followed by cell value information specified in space-delimited row-major order, with each row separated by a carriage return.#### Example ASCII raster```ncols 480
nrows 450
xllcorner 378923
yllcorner 4072345
cellsize 30
nodata_value -32768
43 2 45 7 3 56 2 5 23 65 34 6 32 54 57 34 2 2 54 6 
35 45 65 34 2 6 78 4 2 6 89 3 2 7 45 23 5 8 4 1 62 ...```To convert an ASCII file to a raster, the data must be in this same format. The parameters in the header part of the file must match correctly with the structure of the data values.The basic structure of the ESRI ASCII raster has the header information at the beginning of the file followed by the cell value data:The basic structure of the ESRI ASCII raster has the header information at the beginning of the file followed by the cell value data. The spatial location of the raster is specified by the location of the lower left cell, and either by:The center of the lower left cell```NCOLS xxx
NROWS xxx
XLLCENTER xxx
YLLCENTER xxx
CELLSIZE xxx
NODATA_VALUE xxx
row 1
row 2
...
row n```The lower left corner of the lower left cell```NCOLS xxx
NROWS xxx
XLLCORNER xxx
YLLCORNER xxx
CELLSIZE xxx
NODATA_VALUE xxx
row 1
row 2
...
row n```Row 1 of the data is at the top of the raster, row 2 is just under row 1, and so on.#### Header formatThe syntax of the header information is a keyword paired with the value of that keyword. These are the definitions of the keywords:ParameterDescriptionRequirementsNCOLSNumber of cell columnsInteger greater than 0.NROWSNumber of cell rowsInteger greater than 0.XLLCENTER or XLLCORNERX-coordinate of the origin \(by center or lower left corner of the cell\)Match with y-coordinate type.YLLCENTER or YLLCORNERY-coordinate of the origin \(by center or lower left corner of the cell\)Match with x-coordinate type.CELLSIZECell sizeGreater than 0.NODATA\_VALUEThe input values to be NoData in the output rasterOptional. Default is -9999.ASCII header informationData formatThe data component of the ESRI ASCII raster follows the header information.Cell values should be delimited by spaces.No carriage returns are necessary at the end of each row in the raster. The number of columns in the header determines when a new row begins.Row 1 of the data is at the top of the raster, row 2 is just under row 1, and so on.