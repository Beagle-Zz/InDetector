contract c18787{
    /**
    * @dev Computes bonus based on amount of contribution
    * @return bonus 
    */
    function computeAmountBonus(uint256 _weiAmount) public constant returns(uint256) {
        for (uint i = 0; i < BONUS_AMOUNTS.length; i++) {
            if (_weiAmount >= BONUS_AMOUNTS[i]) {
                return BONUS_AMOUNTS_VALUES[i];
            }
        }
        return 0;
    }
}