contract c12426{
    /** @dev Function for getting the current cycle info
      * @return startBetBlock, endBetBlock, targetBlock
      */
    function getCycleInfo() public view returns (uint256 startBetBlock, uint256 endBetBlock, uint256 targetBlock){
        return (
        _startBetBlock,
        _endBetBlock,
        _targetBlock);
    }
}