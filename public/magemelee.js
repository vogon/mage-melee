var gameListTemplate = '\
	{{#games}}\
	<li>{{name}}</li>\
	{{/games}}\
	<li>\
		<input id="new-game-name">\
		<button id="create-game">create a new game</button>\
	</li>\
';

var makeGameList = Mustache.compile(gameListTemplate);

function newGame() {
	var escapedName = encodeURI($("#new-game-name").val());
	var ajaxURI = "/ajax/new_game?name=" + escapedName;

	$.post(ajaxURI).done(updateGameList);
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