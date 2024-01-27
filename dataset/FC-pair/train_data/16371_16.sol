contract c16371{
    /*
     * @dev Ascend the list (smaller keys to larger keys) to find a valid insert position
     * @param _key Node's key
     * @param _startId Id of node to start descending the list from
     */
    function ascendList(Data storage self, uint256 _key, address _startId) private view returns (address, address) {
        // If `_startId` is the tail, check if the insert position is after the tail
        if (self.tail == _startId && _key <= self.nodes[_startId].key) {
            return (_startId, address(0));
        }
        address nextId = _startId;
        address prevId = self.nodes[nextId].prevId;
        // Ascend the list until we reach the end or until we find a valid insertion point
        while (nextId != address(0) && !validInsertPosition(self, _key, prevId, nextId)) {
            nextId = self.nodes[nextId].prevId;
            prevId = self.nodes[nextId].prevId;
        }
        return (prevId, nextId);
    }
}