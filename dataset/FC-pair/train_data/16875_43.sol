contract c16875{
    /**
     * Get the Highest Miles per each Medal Leader
     */
    function getHighestMilesAt(uint _index) public view returns (uint256) {
        require(_index >= 0 && _index < maxLeaders);
        return _highestMiles[_index].miles;
    }
}