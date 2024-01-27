contract c7747{
    /**
     * @dev Update winner bid
     * @param _isAskBid is it AskBid
     * @param _bidder bidder id
     * @param _bidValue bid value
     * @param _previousBidHash hash of the previous bid
     * @param _signatureAssistant signature of the assistant
     * @param _signatureAuctioneer signature of the auctioneer
     */
    function updateWinnerBid(
        bool _isAskBid,
        bytes _bidder,
        uint256 _bidValue,
        bytes _previousBidHash,
        bytes _signatureAssistant,
        bytes _signatureAuctioneer
    ) 
        external
    {
        tryClose();
        require(phase != PHASE_CLOSED);
        require(!_isAskBid);
        require(_bidValue > winnerBidValue);
        require(_bidValue >= minBidValue);
        bytes32 _fingerprint = keccak256(
            abi.encodePacked(
                "auctionBid",
                _isAskBid,
                _bidder,
                _bidValue,
                _previousBidHash
            )
        );
        _fingerprint = toEthSignedMessageHash(_fingerprint);
        require(auctioneer == recover(_fingerprint, _signatureAuctioneer));
        require(assistant == recover(_fingerprint, _signatureAssistant));
        winnerBidder = _bidder;
        winnerBidValue = _bidValue;
        // start challenge period
        closingBlock = block.number + challengePeriod;
        phase = PHASE_CHALLENGE;  
    }
}