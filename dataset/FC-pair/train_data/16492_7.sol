contract c16492{
    /**
    * @dev Fusion Chamber Cool down
    * @param _exhaustionTime Set time in seconds
    */
    function setExhaustionTime(uint _exhaustionTime) public contract_onlyOwner returns(bool success) {
        exhaustionTime = _exhaustionTime;
        return true;
    }
}