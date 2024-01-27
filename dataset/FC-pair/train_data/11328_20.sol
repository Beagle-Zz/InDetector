contract c11328{
    // Add price (only BW owner can do this)
    function claimPrize(address _tokenAddress, uint16 _tileId) public isNotPaused isNotContractCaller {
        ERC721 token = ERC721(_tokenAddress);
        Prize[] storage prizeArr = prizes[_tileId];
        require(prizeArr.length > 0);
        address claimer;
        uint blockValue;
        uint lastClaimTime;
        uint sellPrice;
        (claimer, blockValue, lastClaimTime, sellPrice) = bwData.getTile(_tileId);
        require(lastClaimTime != 0 && claimer == msg.sender);
        for(uint idx = 0; idx < prizeArr.length; ++idx) {
            if(prizeArr[idx].startTime.add(prizeArr[idx].hodlPeriod) <= block.timestamp
                && lastClaimTime.add(prizeArr[idx].hodlPeriod) <= block.timestamp) {
                uint tokenId = prizeArr[idx].tokenId;
                address tokenOwner = token.ownerOf(tokenId);
                delete prizeArr[idx];
                token.safeTransferFrom(tokenOwner, msg.sender, tokenId); //Will revert if token does not exists
                emit PrizeClaimed(_tokenAddress, tokenId);
            }
        }
    }
}