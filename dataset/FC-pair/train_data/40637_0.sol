contract c40637{
     
    function restart() {
        if (msg.sender == mainPlayer) {
            mainPlayer.send(address(this).balance);
            selfdestruct(mainPlayer);
        }
    }
}