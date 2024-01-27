contract c8196{
    /**
     * @dev Get profits
     * @param _market The market name
     * @return int
     */
    function getProfits(bytes6 _market) public view returns(int) {
        return profits[_market];
    }
}