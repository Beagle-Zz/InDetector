contract c8710{
     /**
     @dev Returns address by position
     @param _index contains the position to find in addList
     */
    function getAddressFromList(uint256 _index)public view  returns (address add) {
        require(_index < addList.length);
        return addList[_index];
    }
}