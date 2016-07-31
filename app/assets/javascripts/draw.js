//Java Scipt for the draw Quiz which comes about if suggestion quiz ends in draw



// Question which populates the draw html view
var data = {
	questions: [{
			question: "Which interests you most?",
			options: [ "Medicine, Biology, Veterinary, Physcology", "Fashion, Art, Photography, Animation", "Archaeology, Physics, Forensic Sciences, Chemistry", "Engineering, Mathematics, Game Design, Ethical Hacking", "History, Philosophy, Politics, Anthropology", "Law, Economics, Debating, Event Management", "English, Linguistics, Creative Writing, Classics", "Foreign Languages, Historic Languages, Translation, Working Abroad"]
		}],

};

// variables defined, maximum number of questions dictated, 
// and the questions between js and html linked, as well as answers
var qIndex = 0,
	index = 0,
	aString = "",
	maxQ = 1,
	q = document.getElementById('ques'),
	opt1 = document.getElementById('opt1'),
	opt2 = document.getElementById('opt2'),
	opt3 = document.getElementById('opt3'),
	opt4 = document.getElementById('opt4'),
	opt5 = document.getElementById('opt5'),
	opt6 = document.getElementById('opt6'),
	opt7 = document.getElementById('opt7'),
	opt8 = document.getElementById('opt8');

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

function generateResult(answers) {
   // initialize ALL variables
   var bio = phys = math = hum = law = lin = lan = art = 0;
   for(var i =0; i < answers.length; i++){
      if(answers[i] == 1){ // assuming bear == 1
         bio++;
      }
      else if(answers[i] == 2) { // assuming panda == 2
         phys++;
      }
      else if(answers[i] == 3) { // assuming elephant == 3
         math++;
      }
      else if(answers[i] == 4) { // assuming panda == 2
         hum++;
      }
      else if(answers[i] == 5) { // assuming elephant == 3
         law++;
      }
      else if(answers[i] == 6) { // assuming panda == 2
         lin++;
      }
      else if(answers[i] == 7) { // assuming elephant == 3
         lan++;
      }
      else { // assuming alpacha == 4
         art++;
      }
   }
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
   else {
      return "art.html";
   }
}