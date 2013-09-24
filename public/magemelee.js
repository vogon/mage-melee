var gameListTemplate = '\
	{{#games}}\
	<li>{{name}}</li>\
	{{/games}}\
	<li><a href="#" id="create-game">create a new game</a></li>\
';

var makeGameList = Mustache.compile(gameListTemplate);

function newGame() {
	$.post("/ajax/new_game").done(updateGameList);
}

function updateGameList() {
	$.getJSON("/ajax/games")
		.done(function(games) {
			var renderedTemplate = makeGameList(games);
			$(".game-list-container").html(renderedTemplate);
			$("#create-game").click(newGame);
		});
}

$(function () {
	updateGameList();
})