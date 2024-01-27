contract c16818{
    /**
     * Get the Highest Miles Owner per each Medal Leader
     */
    function getHighestMilesOwnerAt(uint _index) public view returns (address) {
        require(_index >= 0 && _index < maxLeaders);
        return _highestMiles[_index].owner;
    }
}