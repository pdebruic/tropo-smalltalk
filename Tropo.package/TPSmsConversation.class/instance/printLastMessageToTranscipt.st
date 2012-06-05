as yet unclassified
printLastMessageToTranscipt
	| msg |
	msg := requests last.
	
	Transcript
		show: 'From: ' ,  (((msg at:'session') at:'from') at: 'id') ;
		cr;
		show: 'Msg: ' , ((msg at:'session') at:'initialText');
		cr