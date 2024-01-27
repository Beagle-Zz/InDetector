contract c8196{
    /**
     * @dev Gets the stock key at the given index
     * @return bytes32 The unique stock key
     */
    function getHolding(uint _index) public view returns(bytes12) {
        return holdings[_index];
    }
}