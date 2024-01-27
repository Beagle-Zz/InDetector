contract c40606{
     
    function collectFee() {
        if (msg.sender == mainPlayer) {
            mainPlayer.send(collectedFee);
        }
    }
}