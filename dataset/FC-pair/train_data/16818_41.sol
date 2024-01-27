contract c16818{
    /**
     * Get the Highest Price per each Medal Leader
     */
    function getHighestPriceAt(uint _index) public view returns (uint256) {
        require(_index >= 0 && _index < maxLeaders);
        return _highestPrices[_index].price;
    }
}