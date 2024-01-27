contract c11328{
    // Add price (only BW owner can do this)
    function addPrize(uint16 _tileId, address _token, uint _tokenId, uint _startTime, uint _hodlPeriod) public isOwner {
        //startTime must be same or after block.timestamp
        uint startTime = _startTime;
        if(startTime < block.timestamp) {
            startTime = block.timestamp;
        }
        // we could check if token exists with ownerOf function in interface, 
        // but if any erc721 token doesn't implement the function, this function would revert.
        // also cheaper to not make an interface call
        prizes[_tileId].push(Prize(_token, _tokenId, startTime, _hodlPeriod));
        emit PrizeCreated(_tileId, _token, _tokenId, block.timestamp, startTime, _hodlPeriod);
    }
}