function new_game() {
	$.post("/new_game");
}

$(function () {
	$('#creategame').click(new_game);
})