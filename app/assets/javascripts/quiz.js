//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap
//= require bootstrap/affix
//= require bootstrap/alert
//= require bootstrap/button
//= require bootstrap/carousel
//= require bootstrap/collapse
//= require bootstrap/dropdown
//= require bootstrap/tab
//= require bootstrap/transition
//= require bootstrap/scrollspy
//= require bootstrap/modal
//= require bootstrap/tooltip
//= require bootstrap/popover
//= require chartkick

//= require_tree .

$( document ).ready(function() {
    console.log( "ready!" );
    
    angular.module('flapperNews', [])
.controller('MainCtrl', [
'$scope',
function($scope){
  $scope.test = 'Hello world!';
}])


(function(){
        
        var app = angular.module('myQuiz',[]);
        
            app.controller('QuizController',['$scope', '$http', '$sce',function($scope, $http, $sce ){
                
                $scope.score = 0;
                $scope.activeQuestion = -1;
                $scope.activeQuestionAnswered = 0;
                $scope.percentage = 0;
                
                $http.get('quiz_data.json').then(function(quizData){
                    
                   $scope.myQuestions = quizData.data;
                   $scope.totalQuestions = $scope.myQuestions.length;
                    
                    
                });
                
            }]);
            
        
        });

});
