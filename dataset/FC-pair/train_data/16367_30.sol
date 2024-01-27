contract c16367{
    /*
     * @dev Descend the list (larger keys to smaller keys) to find a valid insert position
     * @param _key Node's key
     * @param _startId Id of node to start ascending the list from
     */
    function descendList(Data storage self, uint256 _key, address _startId) private view returns (address, address) {
        // If `_startId` is the head, check if the insert position is before the head
        if (self.head == _startId && _key >= self.nodes[_startId].key) {
            return (address(0), _startId);
        }
        address prevId = _startId;
        address nextId = self.nodes[prevId].nextId;
        // Descend the list until we reach the end or until we find a valid insert position
        while (prevId != address(0) && !validInsertPosition(self, _key, prevId, nextId)) {
            prevId = self.nodes[prevId].nextId;
            nextId = self.nodes[prevId].nextId;
        }
        return (prevId, nextId);
    }
}