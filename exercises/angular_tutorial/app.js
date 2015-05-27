angular.module('flapperNews', []) // Create the 'flapperNews' app
.controller('MainCtrl', [ // Create the main controller.
  '$scope',
  function($scope){

// Test that your scope function is working:
$scope.test = 'Hello world!';

// Create some posts and upvote values:
$scope.posts = [
  {title: 'post 1', upvotes: 5},
  {title: 'post 2', upvotes: 2},
  {title: 'post 3', upvotes: 12},
  {title: 'post 4', upvotes: 9},
  {title: 'post 5', upvotes: 4}
];

// Create a $scope function that will add an object into the posts array:
$scope.addPost = function() {
  if(!$scope.title || $scope.title === '') { return; } // Prevents a user from entering a blank post title.
  $scope.posts.push({title: $scope.title, upvotes: 0}); // Push the new post to the posts array using your 'addPost' function.
  $scope.title = ''; // Clear $scope.title after a new post has been created.
};

}]);