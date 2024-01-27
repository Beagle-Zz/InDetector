contract c16360{
    // ************************* BIDDING ****************************
    /// @notice Allows someone buy obtain an Pre sale token
    /// @param _wave which wave this bid is reference to.
    /// @param _tokenId The Token ID.
    function bid(uint256 _wave, uint256 _tokenId) external payable whenNotPaused {
        // Check if token is owned by this contract
        require(ethernautsStorage.ownerOf(_tokenId) == address(this));
        // Check if pre sale is still active
        require(countdowns[_wave] >= now);
        // Check if token is part of the correct wave
        bool existInWave = false;
        for (uint256 i = 0; i < waveToTokens[_wave].length; i++) {
            if (waveToTokens[_wave][i] == _tokenId) {
                existInWave = true;
                break;
            }
        }
        require(existInWave);
        address oldBuyer = tokenToBuyer[_tokenId];
        uint256 sellingPrice = ethernautsStorage.priceOf(_tokenId);
        // Safety check to prevent against an unexpected 0x0 default.
        require(msg.sender != address(0));
        // Making sure sent amount is greater than or equal to the sellingPrice
        require(msg.value > sellingPrice);
        // sellingPrice must be the same value sent
        sellingPrice = msg.value;
        // Update price
        uint256 newPrice = SafeMath.div(SafeMath.mul(sellingPrice, bonus[_wave]), percBase);
        // set new price and owner after confirmed transaction
        uint256 lastPrice = tokenToLastPrice[_tokenId];
        tokenToLastPrice[_tokenId] = sellingPrice;
        ethernautsStorage.setPrice(_tokenId, newPrice);
        tokenToBuyer[_tokenId] = msg.sender;
        // pay back previous buyer and apply percentage return
        if (oldBuyer != address(0)) {
            oldBuyer.transfer(lastPrice);
        }
        Bid(_tokenId, sellingPrice, newPrice, oldBuyer, msg.sender);
    }
}