contract c16921{
    /// @dev Import cuties from previous version of Core contract.
    /// @param _oldAddress Old core contract address
    /// @param _fromIndex (inclusive)
    /// @param _toIndex (inclusive)
    function migrate(address _oldAddress, uint40 _fromIndex, uint40 _toIndex) public onlyOwner whenPaused
    {
        require(_totalSupply() + 1 == _fromIndex);
        BlockchainCutiesCore old = BlockchainCutiesCore(_oldAddress);
        for (uint40 i = _fromIndex; i <= _toIndex; i++)
        {
            uint256 genes;
            uint40 birthTime;
            uint40 cooldownEndTime;
            uint40 momId;
            uint40 dadId;
            uint16 cooldownIndex;
            uint16 generation;            
            (genes, birthTime, cooldownEndTime, momId, dadId, cooldownIndex, generation) = old.getCutie(i);
            Cutie memory _cutie = Cutie({
                genes: genes, 
                birthTime: birthTime, 
                cooldownEndTime: cooldownEndTime, 
                momId: momId, 
                dadId: dadId, 
                cooldownIndex: cooldownIndex, 
                generation: generation,
                optional: 0
            });
            cuties.push(_cutie);
        }
    }
}