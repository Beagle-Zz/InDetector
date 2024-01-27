contract c16211{
    /**
     * Allows the owner to change the bonus of the current phase.
     * 
     * @param _newBonus The new bonus percentage.
     * */
    function changeBonus(uint256 _newBonus) public onlyOwner {
        if(stateOfICO == StateOfICO.PRE) {
            if(bonusForPreICO == _newBonus) { revert(); }
            bonusForPreICO = _newBonus;
            BonusChanged("Pre ICO", _newBonus);
        } else {
            if(bonusForMainICO == _newBonus) { revert(); }
            bonusForMainICO = _newBonus;
            BonusChanged("Main ICO", _newBonus);
        }
    }
}