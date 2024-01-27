contract c12544{
    /**
     * @return The current bonuse percentage.
     * */
    function getBonus() public view returns(uint256 _bonus) {
        if(stateOfICO == StateOfICO.PRE) { 
            _bonus = bonusForPreICO;
        } else {
            _bonus = bonusForMainICO;
        }
    }
}