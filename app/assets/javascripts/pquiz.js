



var data = {
	questions: [{
			question: "Which best describes you?",
			options: [ "Flexible", "Organised", "Creative", "Resourceful"]
		}, {
			question: "You are faced with a problem, how do you overcome it:",
			options: [ "Using my wit and intuition", "By thinking up a plan of action and carrying it out", "Ask for help", "Have someone else solve it for you"]
		}, {
			question: "If you were stranded on a desert island what would you take?",
			options: [ "Swiss Army Knife", "Survival Guide", "A friend", "Diary" ]
		}, {
			question: "You have the day off, how do you spend it:",
			options: [ "In bed having a long lie", "Studying", "Playing games", "Reading" ]
		}, {
			question: "Your ideal holiday would be:",
			options: [ "Somewhere historic, like the Pyramids", "Somewhere I can lay in the sun and read a book", "Somewhere fun, like Disneyland", "Anywhere but here" ]
	
		}, {
		   question: "My room is:",
			options: [ "Messy enough you could get lost in it", "Sparkling", "Hidden under a pile of clothes and plates",  "Lightly seasoned with clothes and towels"]
	
		}, {
		   question: "You learn best by:",
			options: [ "Discussing with peers", "Reading the instructions or manual", "Getting stuck in, hands on experience" , "Being told what to do" ]
	
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

function generateResult(answers) {
   // initialize ALL variables
   var panda = bear = tiger = alpacha = 0;
   for(var i =0; i < answers.length; i++){
      if(answers[i] == 1){ // assuming bear == 1
         bear++;
      }
      else if(answers[i] == 2) { // assuming panda == 2
         panda++;
      }
      else if(answers[i] == 3) { // assuming tiger == 3
         tiger++;
      }
      else { // assuming alpacha == 4
         alpacha++;
      }
   }
   if (bear > alpacha && bear > panda && bear > tiger) {
      return "sbear.html";
   }
   else if (alpacha > bear && alpacha > panda && alpacha > tiger) {
      return "alpach.html";
   }
   else if (panda > alpacha && panda > bear && panda > tiger) {
      return "rpanda.html";
   }
   else {
      return "tiger.html";
   }
}