contract c12424{
    /** @dev Function which will return the count of target blocks.
      * @return _targetBlockLenght
      */
    function getTargetBlockLength() public view returns (uint256 _targetBlockLenght) {
        return targetBlocks.length;
    }
}