contract c8196{
    /**
     * @dev Get a market at a given index
     * @param _index The market index
     * @return bytes6 market name
     */
    function getMarket(uint _index) public view returns(bytes6) {
        return markets[_index];
    }
}