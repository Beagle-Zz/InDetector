contract c16367{
    /*
     * @dev Add a node to the list
     * @param _id Node's id
     * @param _key Node's key
     * @param _prevId Id of previous node for the insert position
     * @param _nextId Id of next node for the insert position
     */
    function insert(Data storage self, address _id, uint256 _key, address _prevId, address _nextId) public {
        // List must not be full
        require(!isFull(self));
        // List must not already contain node
        require(!contains(self, _id));
        // Node id must not be null
        require(_id != address(0));
        // Key must be non-zero
        require(_key > 0);
        address prevId = _prevId;
        address nextId = _nextId;
        if (!validInsertPosition(self, _key, prevId, nextId)) {
            // Sender's hint was not a valid insert position
            // Use sender's hint to find a valid insert position
            (prevId, nextId) = findInsertPosition(self, _key, prevId, nextId);
        }
        self.nodes[_id].key = _key;
        if (prevId == address(0) && nextId == address(0)) {
            // Insert as head and tail
            self.head = _id;
            self.tail = _id;
        } else if (prevId == address(0)) {
            // Insert before `prevId` as the head
            self.nodes[_id].nextId = self.head;
            self.nodes[self.head].prevId = _id;
            self.head = _id;
        } else if (nextId == address(0)) {
            // Insert after `nextId` as the tail
            self.nodes[_id].prevId = self.tail;
            self.nodes[self.tail].nextId = _id;
            self.tail = _id;
        } else {
            // Insert at insert position between `prevId` and `nextId`
            self.nodes[_id].nextId = nextId;
            self.nodes[_id].prevId = prevId;
            self.nodes[prevId].nextId = _id;
            self.nodes[nextId].prevId = _id;
        }
        self.size = self.size.add(1);
    }
}