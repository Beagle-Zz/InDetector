contract c16367{
    /*
     * @dev Returns the previous node (with a larger key) in the list for a given node
     * @param _id Node's id
     */
    function getPrev(Data storage self, address _id) public view returns (address) {
        return self.nodes[_id].prevId;
    }
}