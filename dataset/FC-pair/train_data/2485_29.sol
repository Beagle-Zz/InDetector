contract c2485{
    /**
    * @notice sets the maximum percentage that an individual token holder can hold
    * @param _maxHolderPercentage is the new maximum percentage (multiplied by 10**16)
    */
    function changeHolderPercentage(uint256 _maxHolderPercentage) public onlyOwner {
        emit LogModifyHolderPercentage(maxHolderPercentage, _maxHolderPercentage);
        maxHolderPercentage = _maxHolderPercentage;
    }
}