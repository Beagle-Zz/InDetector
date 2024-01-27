contract c8970{
    /// @notice set start and end block for funding
    /// @param _fundingStartBlock start funding
    /// @param _fundingEndBlock  end funding
    function setCampaign(uint256 _fundingStartBlock, uint256 _fundingEndBlock) onlyOwner public{
        if(block.number < _fundingStartBlock){
            fundingStartBlock = _fundingStartBlock;
        }
        if(_fundingEndBlock > fundingStartBlock && _fundingEndBlock > block.number){
            fundingEndBlock = _fundingEndBlock;
        }
        emit ChangeCampaign(_fundingStartBlock,_fundingEndBlock);
    }
}