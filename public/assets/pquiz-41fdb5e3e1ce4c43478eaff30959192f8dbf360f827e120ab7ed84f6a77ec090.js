//Java Scipt for Personality Quiz 


//Questions Which populate the main quiz html view
var data = {
	questions: [{
			question: "Which best describes you?",
			options: [ "Flexible", "Organised", "Creative", "Resourceful"]
		}, {
			question: "You are faced with a problem, how do you overcome it:",
			options: [ "Using my wit and intuition", "By thinking up a plan of action  and carrying it out", "Ask for help", "By tackling it head on without thinking"]
		}, {
			question: "If you were stranded on a desert island what would you take?",
			options: [ "Swiss Army Knife", "Survival Guide", "A friend", "Machete" ]
		}, {
			question: "You have the day off, how do you spend it:",
			options: [ "In bed having a long lie", "Studying", "Playing games", "Doing something active" ]
		}, {
			question: "Your ideal holiday would be:",
			options: [ "Somewhere historic, like the Pyramids", "Somewhere I can lay in the sun and read a book", "Somewhere fun, like Disneyland", "Anywhere but here" ]
	
		}, {
		   question: "My room is:",
			options: [ "Messy enough you could get lost in it", "Sparkling", "Hidden under a pile of clothes and plates",  "Lightly seasoned with clothes and towels"]
	
		}, {
		   question: "You learn best by:",
			options: [ "Discussing with peers", "Reading the instructions or manual", "Getting stuck in, hands on experience" , "Being thrown in the deep end" ]
	
		}, {
		   question: "In class you can be found:",
			options: [ "Distracting others and making them laugh", "Asking the teacher questions", "Doodling on your jotter", "Listening and taking notes" ]
	
		}, {
			question: "Would you consider yourself easily distracted?",
			options: [ "I'm listening, something about distracted", "Never, you have my full attention!", "Hey, look, a pidgey!", "I sometimes find myself distracted"]
	
		}, {
			question: "Another quiz, why are you always procrastinating?! ",
			options: [ "You don't know me, man!", "I'm not, I've finished all my work already", "Social media, I'm addicted", "Nothing better to do"]
	
		}],

};

// variables defined, maximum number of questions dictated, 
// and the questions between js and html linked, as well as answers 
var qIndex = 0,
	index = 0,
	aString = "",
	maxQ = 10,
	q = document.getElementById('ques'),
	opt1 = document.getElementById('opt1'),
	opt2 = document.getElementById('opt2'),
	opt3 = document.getElementById('opt3'),
	opt4 = document.getElementById('opt4');
	
//populates the questions and answers in html view
function generate(){
	q.innerHTML= data.questions[qIndex].question;
	opt1.value= data.questions[qIndex].options[0];
	opt2.value= data.questions[qIndex].options[1];
	opt3.value= data.questions[qIndex].options[2];
	opt4.value= data.questions[qIndex].options[3];
}

//lets you click buttons and progress
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

//Variables defined. Maths behind the quiz. Assigns a var an answer which will increase its number
function generateResult(answers) {
   // initialize ALL variables
   var panda = bear = tiger = alpacha = 0;
   for(var i =0; i < answers.length; i++){
      if(answers[i] == 1){ 
         bear++;
      }
      else if(answers[i] == 2) {
         panda++;
      }
      else if(answers[i] == 3) { 
         tiger++;
      }
      else { 
         alpacha++;
      }
   }
   
   //determines which results page is returned based on the calculations made above
   if (bear > alpacha && bear > panda && bear > tiger) {
      return "sbear";
   }
   else if (alpacha > bear && alpacha > panda && alpacha > tiger) {
      return "alpach";
   }
   else if (panda > alpacha && panda > bear && panda > tiger) {
      return "rpanda";
   }
   else {
      return "tiger";
   }
}

//lets you finish quiz and get results
function redirect(url) {
	window.location = url;
}
;
