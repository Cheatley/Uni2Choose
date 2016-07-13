//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require chartkick
//= require turbolinks
//= require_tree .



var data = {
	questions: [{
			question: "Which interests you most?",
			options: [ "Medicine" , "Statistics" , "Music", "Ancient History"  ]
		}, {
			question: "Which interests you most?",
			options: [ "Biology" , "IT", "Sculpting", "English" ]
		}, {
			question: "Which interests you most?",
			options: [ "Psychology" , "Engineering", "Accounting", "Debating" ]
		}, {
			question: "Which interests you most?",
			options: [ "Animals" , "Maths", "Drama", "Politics" ]
		}, {
			question: "Which interests you most",
			options: [ "Nutrition" , "Coding", "Fashion", "Languages" ]
		}, {
			question: "Which interests you most",
			options: [ "Sports" , "Physics", "Photography", "Creative Writing" ]
		}, {
			question: "Which interests you most?",
			options: [ "Outdoors" , "Chemistry", "Design", "Philosophy" ]
		}, {
			question: "Which interests you most?",
			options: [ "Agriculture" , "Computing", "Economics", "Teaching"]
		}, {
			question: "Which interests you most?",
			options: [ "Forestry", "Forensics", "Art", "History" ]
		}, {
			question: "Which interests you most?",
			options: [ "Dentistry" , "Geography", "Graphics", "Archaeology" ]
		}],
	geeks: [
		{
			name: "Medicine and Related subjects",
			info: "Such as Medicine, Nursing, Psychology, or Vetinary studies. "
		}, {
			name: "Science courses",
			info: "Such as physics, biology, chemistry, or geography."
		}, {
			name: "Law and Business courses",
			info: "Such as Law, Business Management, or Economics."
		}, {
			name: "Art and Design courses",
			info: "Such as Media Design, Graphics or Painting."
		}, {
			name: "Arts and Humanities courses",
			info: "Such as Archaeology, History or Philosophy."
		}, {
			name: "Computing and Engineering courses",
			info: "Such as Engineering, Computer Engineering, or Software Development."
		}, {
			name: "Language courses",
			info: "Such as Spanish Studies, French or Gaelic."
		}]
};

var qIndex = 0,
	index = 0,
	aString = "",
	maxQ = 10,
	alpha = 0,
	beta = 0,
	charlie = 0,
	delta = 0,
	
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
	if(ans==0 ) alpha++;
	else if (ans==1	) beta++;
	else if (ans==2) charlie++;
	else if (ans==3) delta++;
	

	if(qIndex%1==0){
		aString+=ans;
		index++;
	}
	qIndex++;
	if(qIndex == maxQ){
		redirect( "result.html?" + generateResult(aString) );
	} else{
		generate();
	}
}

function generateResult(answers) {
	if( answers=="1111011110" || answers=="1100011000" || answers=="0100001000" ) return 0;
	else if( answers=="1111111111" || answers=="0101001010" ) return 1;
	else if( answers=="1001110011" || answers=="1001110111" || answers=="0010100101" ) return 2;
	else if( answers=="1010010100" || answers=="0011000110" || answers=="0000000000" ) return 3;
	else if( answers=="1010110101" ) return 4;
	else if( answers=="1110111101" || answers=="1001010010" || answers=="0111101111" ) return 5;
	else return 6;
}

function showResult() {
	var id = window.location.search.substring(1);
	var Geeks = data.geeks;
	var totalGeeks = Object.keys(Geeks).length - 1;
	if( id > totalGeeks || id < 0 || !id ) redirect("new.html");
	var name = document.getElementById("geekName");
	var info = document.getElementById("geekInfo");
	/** var img = document.getElementById("geekImage"); **/
	name.innerHTML = Geeks[id].name;
	img.src = "img/"+id+".png";
	img.alt =Geeks[id].name;
	info.innerHTML = Geeks[id].info;
}

function redirect(url) {
	window.location = url;
}

