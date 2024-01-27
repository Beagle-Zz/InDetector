contract c12968{
    /*
     * @dev Check if a pair of nodes is a valid insertion point for a new node with the given key
     * @param _key Node's key
     * @param _prevId Id of previous node for the insert position
     * @param _nextId Id of next node for the insert position
     */
    function validInsertPosition(Data storage self, uint256 _key, address _prevId, address _nextId) public view returns (bool) {
        if (_prevId == address(0) && _nextId == address(0)) {
            // `(null, null)` is a valid insert position if the list is empty
            return isEmpty(self);
        } else if (_prevId == address(0)) {
            // `(null, _nextId)` is a valid insert position if `_nextId` is the head of the list
            return self.head == _nextId && _key >= self.nodes[_nextId].key;
        } else if (_nextId == address(0)) {
            // `(_prevId, null)` is a valid insert position if `_prevId` is the tail of the list
            return self.tail == _prevId && _key <= self.nodes[_prevId].key;
        } else {
            // `(_prevId, _nextId)` is a valid insert position if they are adjacent nodes and `_key` falls between the two nodes' keys
            return self.nodes[_prevId].nextId == _nextId && self.nodes[_prevId].key >= _key && _key >= self.nodes[_nextId].key;
        }
    }
}