contract c18277{
    /**
        @dev adding bonus
    */
    function withBonus(uint256 _amount, uint _percent) internal pure
        returns (uint256)
    {
        return div(mul(_amount, _percent), 100);
    }
}