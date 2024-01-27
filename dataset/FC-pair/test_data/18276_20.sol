contract c18276{
    /**
        @dev count summ with bonus
    */
    function countBonus(uint256 amount) internal view
        returns (uint256)
    {
        uint256 _amount = div(mul(amount, DEC), price);
        return _amount = add(_amount, withBonus(_amount, Crowd.bonus));
    }
}