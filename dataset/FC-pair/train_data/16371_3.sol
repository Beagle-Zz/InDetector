contract c16371{
    /*
     * @dev Update the key of a node in the list
     * @param _id Node's id
     * @param _newKey Node's new key
     * @param _prevId Id of previous node for the new insert position
     * @param _nextId Id of next node for the new insert position
     */
    function updateKey(Data storage self, address _id, uint256 _newKey, address _prevId, address _nextId) public {
        // List must contain the node
        require(contains(self, _id));
        // Remove node from the list
        remove(self, _id);
        if (_newKey > 0) {
            // Insert node if it has a non-zero key
            insert(self, _id, _newKey, _prevId, _nextId);
        }
    }
}