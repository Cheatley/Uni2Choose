//Java Scipt for Course Suggestion Quiz 



// Questions Which populate the main quiz html view
var data = {
	questions: [{
			question: "Which interests you most?",
			options: [ "Medicine", "Fashion", "Archaeology", "Engineering", "History","Law", "English", "Foreign Languages"]
		}, {
			question: "Which interests you most?",
			options: [ "Dentistry",  "Art", " Geology", "Mathematics", "Philosophy", "Accountancy", "Linguistics", "Historic Languages"]
		}, {
			question: "Which interests you most?",
			options: [ "Biology", "Drawing", "Geography", "Chemical Engineering", "Religious Education", "Economics", "Creative Writing", "Philology"]
		}, {
			question: "Which interests you most?",
			options: [ "Animal Behaviour", "Media Design", "Physics", "Computing", "Politics", "Business Management", "Classics", "Translating"]
		}, {
			question: "Which interests you most?",
			options: [ "Genetics", "Graphics", "Forensic Sciences", "Mechanical Engineering", "Film Studies", "Debating", "English Literature", "Interpreting"]
	
		}, {
		    question: "Which interests you most?",
			options: [ "Marine Biology", "Sculpting", "Astrophysics", "Game Design",  "Ancient History", "Finance", "Acting", "Working abroad"]
	
		}, {
		    question: "Which interests you most?",
			options: [ "Psychology",  "Animation", "Chemistry", "Artificial Intelligence" , "Ethnology", "Event Management", "Latin", "Travel"]
	
		}, {
		    question: "Which interests you most?",
			options: [ "Zoology",  "Painting", "Astronomy", "Information Technology", "Anthropology", "Tourism", "Greek", "Hebrew Studies"]
	
		}, {question: "Which interests you most?",
			options: [ "Vet", "Photography", "Earth Sciences", "Ethical Hacking",  "Sociology", "Hospitality", "Social Policy", "Saga Studies"]
	
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
	opt4 = document.getElementById('opt4'),
	opt5 = document.getElementById('opt5'),
	opt6 = document.getElementById('opt6'),
	opt7 = document.getElementById('opt7'),
	opt8 = document.getElementById('opt8');

//populates the questions and answers in html view
function generate(){
	q.innerHTML= data.questions[qIndex].question;
	opt1.value= data.questions[qIndex].options[0];
	opt2.value= data.questions[qIndex].options[1];
	opt3.value= data.questions[qIndex].options[2];
	opt4.value= data.questions[qIndex].options[3];
   opt5.value= data.questions[qIndex].options[4];
   opt6.value= data.questions[qIndex].options[5];
	opt7.value= data.questions[qIndex].options[6];
   opt8.value= data.questions[qIndex].options[7];
}

//Variables defined. Maths behind the quiz. Assigns a var an answer which will increase its number
function generateResult(answers) {
   // initialize ALL variables
   var bio = phys = math = hum = law = lin = lan = art = 0;
   for(var i =0; i < answers.length; i++){
      if(answers[i] == 1){ 
         bio++;
      }
      else if(answers[i] == 2) {
         phys++;
      }
      else if(answers[i] == 3) { 
         math++;
      }
      else if(answers[i] == 4) {
         hum++;
      }
      else if(answers[i] == 5) { 
         law++;
      }
      else if(answers[i] == 6) {
         lin++;
      }
      else if(answers[i] == 7) { 
         lan++;
      }
      else { 
         art++;
      }
   }
   
   //determines which results page is returned based on the calculations made above
   if (bio > phys && bio > math && bio > hum && bio > law && bio > lin && bio > lan && bio > art) {
      return "bio.html";
   }
   else if (phys > bio && phys > math && phys > hum && phys > law && phys > lin && phys > lan && phys > art) {
      return "phys.html";
   }
   else if (math > bio && math > phys && math > hum && math > law && math > lin && math > lan && math > art) {
      return "math.html";
   }
   else if (hum > bio && hum > math && hum > phys && hum > law && hum > lin && hum > lan && hum > art) {
      return "hum.html";
   }
   else if (law > bio && law > phys && law > hum && law > math && law > lin && law > lan && law > art) {
      return "law.html";
   }   
      else if (lin > bio && lin > math && lin > hum && lin > law && lin > phys && lin > lan && lin > art) {
      return "lin.html";
   }
   else if (lan > bio && lan > phys && lan > hum && lan > law && lan > lin && lan > math && lan > art) {
      return "lan.html";
   }
   else if (art > bio && art > phys && art > hum && art > law && art > lin && art > math && art > lan) {
      return "art.html";
   }
   else {
      return "draw.html";
   }
}