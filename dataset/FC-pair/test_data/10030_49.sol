contract c10030{
    /*
     * @dev Change the minimum bet amount. Just in case the price of eth skyrockets or drops.
     * @param _newMin   the new minimum bet amount
     */ 
    function changeMiniumBet(uint _newMin) public onlyOwner {
        minimum_bet = _newMin;
    }
}