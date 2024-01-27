contract c7942{
    /// @dev turn on the funding state
    function startFunding (uint256 _fundingStartBlock, uint256 _fundingStopBlock) isOwner external {
        require (!isFunding);
        require (_fundingStartBlock < _fundingStopBlock);
        require (block.number < _fundingStartBlock);
        fundingStartBlock = _fundingStartBlock;
        fundingStopBlock = _fundingStopBlock;
        isFunding = true;
    }
}