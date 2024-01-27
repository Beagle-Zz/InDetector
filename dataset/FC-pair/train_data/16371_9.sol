contract c16371{
    /*
     * @dev Returns the key of a node in the list
     * @param _id Node's id
     */
    function getKey(Data storage self, address _id) public view returns (uint256) {
        return self.nodes[_id].key;
    }
}