var gameListTemplate = '\
	{{#games}}\
	<li>{{name}}</li>\
	{{/games}}\
	<li><a href="#" id="create-game">create a new game</a></li>\
';

var makeGameList = Mustache.compile(gameListTemplate);

function new_game() {
	$.post("/ajax/new_game");
	update_game_list();
}

function update_game_list() {
	$.get("/ajax/games", 
		function(games) {
			var renderedTemplate = makeGameList(JSON.parse(games));
			$(".game-list-container").html(renderedTemplate);
			$("#create-game").click(new_game);
		});
}

$(function () {
	update_game_list();
	// $('#creategame').click(new_game);
})