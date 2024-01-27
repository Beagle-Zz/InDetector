contract c13405{
    /// @notice Export MET tokens from this chain to another chain.
    /// @param tokenOwner Owner of the token, whose tokens are being exported.
    /// @param _destChain Destination chain for exported tokens
    /// @param _destMetronomeAddr Metronome address on destination chain
    /// @param _destRecipAddr Recipient address on the destination chain
    /// @param _amount Amount of token being exported
    /// @param _extraData Extra data for this export
    /// @return boolean true/false based on the outcome of export
    function export(address tokenOwner, bytes8 _destChain, address _destMetronomeAddr,
        address _destRecipAddr, uint _amount, uint _fee, bytes _extraData) public returns (bool) 
    {
        require(msg.sender == address(token));
        require(_destChain != 0x0 && _destMetronomeAddr != 0x0 && _destRecipAddr != 0x0 && _amount != 0);
        require(destinationChains[_destChain] == _destMetronomeAddr);
        require(token.balanceOf(tokenOwner) >= _amount.add(_fee));
        token.destroy(tokenOwner, _amount.add(_fee));
        uint dailyMintable = auctions.dailyMintable();
        uint currentTick = auctions.currentTick();
        if (burnSequence == 1) {
            exportedBurns.push(keccak256(uint8(0)));
        }
        if (_destChain == auctions.chain()) {
            claimables[_destMetronomeAddr][_destRecipAddr] = 
                claimables[_destMetronomeAddr][_destRecipAddr].add(_amount);
        }
        uint blockTime = block.timestamp;
        bytes32 currentBurn = keccak256(
            blockTime, 
            auctions.chain(),
            _destChain, 
            _destMetronomeAddr, 
            _destRecipAddr, 
            _amount,
            currentTick,
            auctions.genesisTime(),
            dailyMintable,
            token.totalSupply(),
            _extraData,
            exportedBurns[burnSequence - 1]);
        exportedBurns.push(currentBurn);
        supplyOnAllChains[0] = token.totalSupply();
        emit ExportReceiptLog(_destChain, _destMetronomeAddr, _destRecipAddr, _amount, _fee, _extraData, 
            currentTick, burnSequence, currentBurn, exportedBurns[burnSequence - 1], dailyMintable,
            supplyOnAllChains, auctions.genesisTime(), blockTime, auctions.dailyAuctionStartTime());
        burnSequence = burnSequence + 1;
        chainLedger.registerExport(auctions.chain(), _destChain, _amount);
        return true;
    }
}