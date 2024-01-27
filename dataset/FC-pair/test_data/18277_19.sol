contract c18277{
    /*
        @dev safe sales contoller
    */
    function confirmSell(uint256 _amount) internal view
        returns (bool)
    {
        if (Crowd.tokens < _amount) {
            return false;
        }
        return true;
    }
}