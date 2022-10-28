 function optionSelect(num){
	var selected="";
	var option=''.concat('#searchOption',num);
		if(num==1){
			selected='${searchOp.searchOption1}';
		}else if(num==2) {
			selected='${searchOp.searchOption2}';
		}else {
			selected='${searchOp.orderOption}';
			option='#orderOption';
		}
		console.log(option);
	
	for(i=1; i<=4; i++)	{
		var val = $(option+' option:eq('+i+')').val(); 
		if(selected==val) 
			$(option+' option:eq('+i+')').prop("selected", "selected");
	}
}