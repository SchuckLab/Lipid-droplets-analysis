//open images from a given directory
	setBatchMode(true);
	dir = getDirectory("Choose a Directory");
	list = getFileList(dir);

// generate folders and subfolders required for further processing	
	File.makeDirectory(dir+"_bright15");
	File.makeDirectory(dir+"_bright15_smooth5");

		for (i=0; i<list.length; i++) {
			open(dir+list[i]);
			onoma=getTitle;

//run contrast&brightness adjutment to reach a saturation of 15.0, apply and save
			run("Enhance Contrast", "saturated=15.00");
			run("Apply LUT");
			
			name2= replace(onoma,".TIF","_bright.tif");
			save(dir+"_bright15/"+name2);
			
//run smoothing five times, then save			
			run("Smooth");
			run("Smooth");
			run("Smooth");
			run("Smooth");
			run("Smooth");

			name3= replace(onoma,".TIF","bright15_smooth5.tif");
			save(dir+"_bright15_smooth5/"+name3);


			close("*");
	 	    }
