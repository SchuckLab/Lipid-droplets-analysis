//opens stacks in a folder subsequently, removes individual images from stacks and saves them in individual subdirectories called, for instance, "_Autodot"
setBatchMode(true);
dir = getDirectory("Choose a Directory");
list = getFileList(dir);
File.makeDirectory(dir+"_Autodot");
File.makeDirectory(dir+"_mEmerald");
for (i=0; i<list.length; i++) 
		{
		if (list[i].endsWith("nd2")) {
		openpath = dir + File.separator + list[i]; // Construct the file path
		run("Bio-Formats Importer", "open=openpath autoscale color_mode=Composite open_all_series rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
									};
		else {
		open(dir+list[i]);
			};
		
		
			list2 = getList("image.titles"); //creates a list with image names for each field of view
			for (j=0; j<list2.length; j++)
			{
				
				onoma = getTitle;
				n=nSlices;
				
				if (n==2) {
				run("Stack Splitter", "number=2"); 				
				}

				
			//	title = getTitle;
				
				
				list3 = getList("image.titles");
			//	Array.show(list3);
				for(k = 0;k<list3.length;k++)	
					{
					if(matches(list3[k],".*c:1/2 - .*"))		
						{
						selectWindow(list3[k]);
						title = getTitle;
						coretitle=replace(title, "c:1/2 - 24","24"); //adjust according to image name
						name=replace(coretitle,".nd2","_Autodot");
						saveAs("tiff", dir+"_Autodot/"+name);		
						close();
						}

						
					if(matches(list3[k],".*c:2/2 - .*"))		
						{
					selectWindow(list3[k]);
					title = getTitle;
					coretitle=replace(title, "c:2/2 - 24","24"); //adjust according to image name
					name=replace(coretitle,".nd2","_mEmerald");
					saveAs("tiff", dir+"_mEmerald/"+name);		
					close();
						};
					};
					close(onoma);	
				};

		}