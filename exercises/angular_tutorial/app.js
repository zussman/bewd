angular.module('flapperNews', ['ui.router']) // Create the 'flapperNews' app

.config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('home', {
        url: '/home',
        templateUrl '/home.html',
        controller: 'MainCtrl'
      });

    $urlRouterProvider.otherwise('home');
  }])

.factory('posts', [function() {
  // service body (that's really a factory)
  var o = {
    posts: []
  };
  return o;
}])

.controller('MainCtrl', [ // Create the main controller.
  '$scope',
  'posts'
  function($scope, posts){

// Test that your scope function is working:
$scope.test = 'Hello world!';

// Create some posts and upvote values:
$scope.posts = posts.posts;

// Create a $scope function that will add an object into the posts array:
$scope.addPost = function() {
  if(!$scope.title || $scope.title === '') { return; } // Prevents a user from entering a blank post title.
  $scope.posts.push({
    title: $scope.title,
    link: $scope.link,
    upvotes: 0
  }); // Push the new post to the posts array using your 'addPost' function.
  $scope.title = ''; // Clear $scope.title after a new post has been created.
  $scope.link = ''; // Reset the link after you add a new post.
  $scope.incrementUpvotes = function(post) { // Increment up the upvotes when someone clicks on the upvote span next to each post.
    post.upvotes += 1; // adds 1 to the current value of upvotes.
  };
};

}]);