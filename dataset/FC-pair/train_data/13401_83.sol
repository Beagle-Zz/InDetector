contract c13401{
    /// @notice import MET tokens from another chain to this chain.
    /// @param _destinationChain destination chain name
    /// @param _addresses _addresses[0] is destMetronomeAddr and _addresses[1] is recipientAddr
    /// @param _extraData extra information for import
    /// @param _burnHashes _burnHashes[0] is previous burnHash, _burnHashes[1] is current burnHash
    /// @param _supplyOnAllChains MET supply on all supported chains
    /// @param _importData _importData[0] is _blockTimestamp, _importData[1] is _amount, _importData[2] is _fee
    /// _importData[3] is _burnedAtTick, _importData[4] is _genesisTime, _importData[5] is _dailyMintable
    /// _importData[6] is _burnSequence, _importData[7] is _dailyAuctionStartTime
    /// @param _proof proof
    /// @return true/false
    function importMET(bytes8 _originChain, bytes8 _destinationChain, address[] _addresses, bytes _extraData, 
        bytes32[] _burnHashes, uint[] _supplyOnAllChains, uint[] _importData, bytes _proof) public returns (bool)
    {
        require(msg.sender == address(token));
        require(_importData.length == 8);
        require(_addresses.length == 2);
        require(_burnHashes.length == 2);
        require(validator.isReceiptClaimable(_originChain, _destinationChain, _addresses, _extraData, _burnHashes, 
        _supplyOnAllChains, _importData, _proof));
        validator.claimHash(_burnHashes[1]);
        require(_destinationChain == auctions.chain());
        uint amountToImport = _importData[1].add(_importData[2]);
        require(amountToImport.add(token.totalSupply()) <= auctions.globalMetSupply());
        require(_addresses[0] == address(token));
        if (_importData[1] == 0) {
            return false;
        }
        if (importSequence == 1 && token.totalSupply() == 0) {
            auctions.prepareAuctionForNonOGChain();
        }
        token.mint(_addresses[1], _importData[1]);
        emit ImportReceiptLog(_addresses[1], _importData[1], _importData[2], _extraData,
        auctions.currentTick(), importSequence, _burnHashes[1],
        _burnHashes[0], auctions.dailyMintable(), now, msg.sender);
        importSequence++;
        chainLedger.registerImport(_originChain, _destinationChain, _importData[1]);
        return true;
    }
}