//open images from a given directory
	setBatchMode(true);
	dir = getDirectory("Choose a Directory");
	list = getFileList(dir);

// generate folders and subfolders required for further processing	
	File.makeDirectory(dir+"_BGsubRB50");

		for (i=0; i<list.length; i++) {
			open(dir+list[i]);
			onoma=getTitle;

// run a Background Subtraction, using a rolling ball algorithm with a set radius of 50 (change radius if required)
			run("Subtract Background...", "rolling=50");

			
// save background subtracted image with tagged name as a tif in the subfolder created above 			
			name= replace(onoma,".tif","_BGsubRB50.tif");
			save(dir+"_BGsubRB50/"+name);
			

			close("*");
	 	    }
