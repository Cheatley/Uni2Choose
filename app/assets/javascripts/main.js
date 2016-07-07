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
			name: "Linus Torvalds",
			info: "Linus Benedict Torvalds is a Finnish American software engineer, who was the principal force behind the development of the Linux kernel that became the most popular kernel for operating systems."
		}, {
			name: "Dennis Ritchie",
			info: "Dennis MacAlistair Ritchie was an American computer scientist. He created the C programming language and, with long-time colleague Ken Thompson, the Unix operating system."
		}, {
			name: "Bill Gates",
			info: "William Henry 'Bill' Gates III is an American business magnate, philanthropist, investor, computer programmer, and inventor."
		}, {
			name: "Steve Jobs",
			info: "Steven Paul 'Steve' Jobs was an American entrepreneur, marketer, and inventor, who was the cofounder, chairman, and CEO of Apple Inc."
		}, {
			name: "Steve Wozniak",
			info: "Stephen Gary 'Steve' Wozniak, known as 'Woz', is an American inventor, electronics engineer, and computer programmer who co-founded Apple Computer with Steve Jobs and Ronald Wayne."
		}, {
			name: "Mark Zuckerberg",
			info: "Mark Elliot Zuckerberg is an American computer programmer and Internet entrepreneur. He is best known as one of five co-founders of the social networking website Facebook. Zuckerberg is the chairman and chief executive of Facebook, Inc."
		}, {
			name: "Tim Berners-Lee",
			info: "Sir Timothy John 'Tim' Berners-Lee, also known as TimBL, is an English computer scientist, best known as the inventor of the World Wide Web."
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
	var img = document.getElementById("geekImage");
	name.innerHTML = Geeks[id].name;
	img.src = "img/"+id+".png";
	img.alt =Geeks[id].name;
	info.innerHTML = Geeks[id].info;
}

function redirect(url) {
	window.location = url;
}

