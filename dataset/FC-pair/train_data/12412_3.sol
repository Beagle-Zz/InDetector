contract c12412{
    /**
     *  @dev Get investors count
     *  @return uint count
     */
    function getInvestorsCount() public constant returns (uint) {
        return investors.length;
    }
}