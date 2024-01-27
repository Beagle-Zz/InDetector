contract c16367{
    /*
     * @dev Returns the first node in the list (node with the largest key)
     */
    function getFirst(Data storage self) public view returns (address) {
        return self.head;
    }
}