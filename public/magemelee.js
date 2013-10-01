function newGame() {
	var escapedName = encodeURI($("#new-game-name").val());
	var ajaxURI = "/ajax/new_game?name=" + escapedName;

	$.post(ajaxURI).done(updateGameList);
}

var fn;

function updateGameList() {
	$.getJSON("/ajax/games")
		.done(function(games) {
			// rerender template using new game list
			fn = fn || $(".game-list").compile(null, games);
			$(".game-list").render(games, fn);

			$("#create-game").click(newGame);
		});
}

$(function () {
	updateGameList();
})