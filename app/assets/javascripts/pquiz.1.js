

var data = {
	questions: [{
			question: "Which best describes you?",
			options: [ "Organised" , "Creative", "Flexible", "Resourceful" ]
		}, {
			question: "You are faced with a problem, how do you overcome it:",
			options: [ "Using my wit and intuition" , "By thinking up a plan of action and carrying it out", "Ask for help", "Have someone else solve it for you"]
		}, {
			question: "If you were stranded on a desert island what would you take?",
			options: [ "Survival Guide" , "Swiss Army Knife", "Diary", "A friend"]
		}, {
			question: "You have the day off, how do you spend it:",
			options: [ "Playing games" , "In bed having a long lie", "Studying", "Reading" ]
		}, {
			question: "Your ideal holiday would be:",
			options: [ "Somewhere fun, like Disneyland" , "Somewhere historic, like the Pyramids", "Somewhere I can lay in the sun and read a book", "Anywhere but here"]
	
		}, {
		    question: "My room is:",
			options: [ "Messy enough you could get lost in it" , "Hidden under a pile of clothes and plates", "Lightly seasoned with clothes and towels", "Sparkling"]
	
		}, {
		    question: "You learn best by:",
			options: [ "Getting stuck in, hands on experience" , "Reading the instructions or manual", "Being told what to do", "Discussing with peers"]
	
		}, {
		    question: "In class you can be found:",
			options: [ "Distracting others and making them laugh" , "Doodling on your jotter", "Listening and taking notes", "Asking the teacher questions"]
	
		}, {question: "If the world was going to end tomorrow, how would you spend today?",
			options: [ "Learning as much as I could about the world" , "Having as much fun as possible", "Living out a dream", "Spending time with loved ones"]
	
		}, {question: "Another quiz, why are you always procrastinating?! ",
			options: [ "I'm not, I've finished all my work already" , "Nothing better to do", "You don't know me, man!", "Social media, I'm addicted"]
	
		}],

};

var qIndex = 0,
	index = 0,
	aString = "",
	maxQ = 10,
	q = document.getElementById('ques'),
	opt1 = document.getElementById('opt1'),
	opt2 = document.getElementById('opt2'),
	opt3 = document.getElementById('opt3'),
	opt4 = document.getElementById('opt4');

function generate(){
	q.innerHTML= data.questions[qIndex].question;
	opt1.value= data.questions[qIndex].options[0];
	opt2.value= data.questions[qIndex].options[1];
	opt3.value= data.questions[qIndex].options[2];
	opt4.value= data.questions[qIndex].options[3];
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
	if( answers =="00000" || answers =="00001" || answers=="00010" || answers=="00100" || answers=="01000" || answers=="10000" || answers=="00011" || answers=="00110" || answers=="01100" || answers=="11000" || answers=="00101" || answers=="01010" || answers=="10100" || answers=="01001" || answers=="10010" || answers=="10001" ) return "sbear.html";
	else if( answers=="11111" || answers=="11110" || answers=="11101" || answers=="11011" || answers=="10111" || answers=="01111" || answers=="11100" || answers=="11001" || answers=="10011" || answers=="00111" || answers=="11010" || answers=="10101" || answers=="01011" || answers=="10110" || answers=="01101" || answers=="01110" ) return "rpanda.html";
	else return "eleph.html"; 
}


function redirect(url) {
	window.location = url;
}