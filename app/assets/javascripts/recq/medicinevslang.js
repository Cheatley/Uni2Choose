


var data = {
	questions: [{
			question: "Which interests you most?",
			options: [ "Medicine" , "English" ]
		}, {
			question: "Which interests you most?",
			options: [ "Biology" , "Foreign Language"]
		}, {
			question: "Which interests you most?",
			options: [ "Psychology" , "Historical Languages"]
		}, {
			question: "Which interests you most?",
			options: [ "Animals" , "Philology" ]
		}, {
			question: "Which interests you most",
			options: [ "Nutrition" , "Linguistics"]
	
		}],

};

var qIndex = 0,
	index = 0,
	aString = "",
	maxQ = 5,
	q = document.getElementById('ques'),
	opt1 = document.getElementById('opt1'),
	opt2 = document.getElementById('opt2');

function generate(){
	q.innerHTML= data.questions[qIndex].question;
	opt1.value= data.questions[qIndex].options[0];
	opt2.value= data.questions[qIndex].options[1];
}

function optionClick(ans) {
	if(qIndex%1==0){
		aString+=ans;
		index++;
	}
	qIndex++;
	if(qIndex == maxQ){
		
		 redirect( generateResult(aString) );
	} else{
		generate();
	}
}

function generateResult(answers) {
	if( answers =="00000" || answers =="00001" || answers=="00010" || answers=="00100" || answers=="01000" || answers=="10000" || answers=="00011" || answers=="00110" || answers=="01100" || answers=="11000" || answers=="00101" || answers=="01010" || answers=="10100" || answers=="01001" || answers=="10010" || answers=="10001" ) return "lang.html";
	else if( answers=="11111" || answers=="11110" || answers=="11101" || answers=="11011" || answers=="10111" || answers=="01111" || answers=="11100" || answers=="11001" || answers=="10011" || answers=="00111" || answers=="11010" || answers=="10101" || answers=="01011" || answers=="10110" || answers=="01101" || answers=="01110" ) return "comp.html";
	else return "new.html"; 
}


function redirect(url) {
	window.location = url;
}