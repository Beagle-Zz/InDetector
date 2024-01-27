contract c12426{
    /** @dev Function which activates the cycle. 
      * Only the activator can call the function.
      * @param _startBlock The starting block of the game.
      * Set the starting block from which the participants can start to bet for target block.
      * Set the end block to which the participants can bet fot target block. 
      * Set the target block for which the participants will bet.
      * @return success Is the activation of the cycle successful.
      */
    function activateCycle(uint256 _startBlock) public onlyActivator(msg.sender) returns (bool _success) {
        if (_startBlock == 0) {
            _startBlock = block.number;
        }
        require(block.number >= _endBetBlock);
        _startBetBlock = _startBlock;
        _endBetBlock = _startBetBlock.add(END_DURATION_BETTING_BLOCK);
        _targetBlock = _startBetBlock.add(TARGET_DURATION_BETTING_BLOCK);
        targetBlocks.push(_targetBlock);
        return true;
    }
}