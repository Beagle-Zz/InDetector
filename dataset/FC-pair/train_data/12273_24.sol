contract c12273{
    /**
     * @dev Returns cost of requestRates function.
     */
    function requestPrice() public view returns(uint256) {
        uint256 requestCost = 0;
        for (uint256 i = 0; i < oracles.length; i++) {
            requestCost = requestCost.add(OracleI(oracles[i]).getPrice());
        }
        return requestCost;
    }
}