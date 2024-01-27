contract c12968{
    /*
     * @dev Checks if the list contains a node
     * @param _transcoder Address of transcoder
     */
    function contains(Data storage self, address _id) public view returns (bool) {
        // List only contains non-zero keys, so if key is non-zero the node exists
        return self.nodes[_id].key > 0;
    }
}