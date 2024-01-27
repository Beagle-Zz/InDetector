contract c16818{
    /**
     * Get the Highest Price Owner per each Medal Leader
     */
    function getHighestPriceOwnerAt(uint _index) public view returns (address) {
        require(_index >= 0 && _index < maxLeaders);
        return _highestPrices[_index].owner;
    }
}