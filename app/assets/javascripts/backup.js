

var data = {
	questions: [{
			question: "Which best describes you?",
			options: [ "Creative", "Flexible", "Organised" , "Resourceful"]
		}, {
			question: "You are faced with a problem, how do you overcome it:",
			options: [ "Ask for help", "Using my wit and intuition", "By thinking up a plan of action and carrying it out", "Have someone else solve it for you"]
		}, {
			question: "If you were stranded on a desert island what would you take?",
			options: [ "A friend", "Swiss Army Knife", "Survival Guide", "Diary" ]
		}, {
			question: "You have the day off, how do you spend it:",
			options: [ "Playing games" , "In bed having a long lie", "Studying", "Reading" ]
		}, {
			question: "Your ideal holiday would be:",
			options: [ "Somewhere fun, like Disneyland" , "Somewhere historic, like the Pyramids", "Somewhere I can lay in the sun and read a book", "Anywhere but here" ]
	
		}, {
		    question: "My room is:",
			options: [ "Hidden under a pile of clothes and plates", "Messy enough you could get lost in it", "Sparkling", "Lightly seasoned with clothes and towels"]
	
		}, {
		    question: "You learn best by:",
			options: [ "Getting stuck in, hands on experience" , "Discussing with peers", "Reading the instructions or manual", "Being told what to do" ]
	
		}, {
		    question: "In class you can be found:",
			options: [ "Doodling on your jotter", "Distracting others and making them laugh", "Asking the teacher questions", "Listening and taking notes" ]
	
		}, {question: "If the world was going to end tomorrow, how would you spend today?",
			options: [ "Spending time with loved ones", "Living out a dream", "Learning as much as I could about the world", "Having as much fun as possible" ]
	
		}, {question: "Another quiz, why are you always procrastinating?! ",
			options: [ "Social media, I'm addicted", "You don't know me, man!", "I'm not, I've finished all my work already", "Nothing better to do"]
	
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
	if(qIndex%2==0){
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
	else return "quiz.html"; 
}


function redirect(url) {
	window.location = url;
}