contract c2117{
    /**
    * @notice sets the maximum percentage that an individual token holder can hold
    * @param _maxHolderCount is the new maximum amount a holder can hold
    */
    function changeHolderCount(uint256 _maxHolderCount) public withPerm(ADMIN) {
        emit LogModifyHolderCount(maxHolderCount, _maxHolderCount);
        maxHolderCount = _maxHolderCount;
    }
}