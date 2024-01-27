contract c2198{
    /**
     * return the game details after ended
     * 0 winner side
     * 1 nomber of player who choose option 1
     * 2 nomber of player who choose option 2
     * 3 total award
     * 4 award of each winner
     **/
    function getEndGameStatus() public isEnded view returns (uint, uint, uint, uint, uint) {
        return (
            winnerSide,
            option1AddressList.length,
            option2AddressList.length,
            finalBalance,
            award
        );
    }
}