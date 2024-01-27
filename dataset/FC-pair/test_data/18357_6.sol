contract c18357{
    /// @dev Can be used before `insert` to build an ordered list
    /// @param self stored linked list from contract
    /// @param _node an existing node to search from, e.g. HEAD.
    /// @param _value value to seek
    /// @param _direction direction to seek in
    //  @return next first node beyond '_node' in direction `_direction`
    function getSortedSpotByFunction(LinkedList storage self, uint256 _node, uint256 _value, bool _direction, function (uint, uint) view returns (bool) smallerComparator, int256 searchLimit)
        internal view returns (uint256 nextNodeIndex, bool found, uint256 sizeEnd)
    {
        if ((sizeEnd=sizeOf(self)) == 0) { return (0, true, sizeEnd); }
        require((_node == 0) || nodeExists(self,_node));
        bool exists;
        uint256 next;
        (exists,next) = getAdjacent(self, _node, _direction);
        while  ((--searchLimit >= 0) && (next != 0) && (_value != next) && (smallerComparator(_value, next) != _direction)) next = self.list[next][_direction];
        if(searchLimit >= 0)
            return (next, true, sizeEnd + 1);
        else return (0, false, sizeEnd); //We exhausted the search limit without finding a position!
    }
}