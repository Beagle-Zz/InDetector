contract c2198{
    /**
     * send award to winner
     **/
    function sendAward() public isEnded {
        require(winnerList.length > 0);
        uint count = winnerList.length;
        if (count > 250) {
            for (uint i = 0; i < 250; i++) {
                this.sendAwardToLastWinner();
            }
        } else {
            for (uint j = 0; j < count; j++) {
                this.sendAwardToLastWinner();
            }
        }
    }
}