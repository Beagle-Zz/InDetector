contract c16367{
    /*
     * @dev Returns the next node (with a smaller key) in the list for a given node
     * @param _id Node's id
     */
    function getNext(Data storage self, address _id) public view returns (address) {
        return self.nodes[_id].nextId;
    }
}