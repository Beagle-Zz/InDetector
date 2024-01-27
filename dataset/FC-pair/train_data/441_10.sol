contract c441{
    // ICO contract configuration function
    // new_ETH_QCO is the new rate of ETH in QCO to use when no bonus applies
    // newEndBlock is the absolute block number at which the ICO must stop. It must be set after now + silence period.
    function updateEthICOVariables(uint256 _new_ETH_QCO, uint256 _newEndBlock)
    public
    onlyStateControl
    {
        require(state == States.Initial || state == States.ValuationSet);
        require(_new_ETH_QCO > 0);
        require(block.number < _newEndBlock);
        endBlock = _newEndBlock;
        // initial conversion rate of ETH_QCO set now, this is used during the Ico phase.
        ETH_QCO = _new_ETH_QCO;
        moveToState(States.ValuationSet);
    }
}