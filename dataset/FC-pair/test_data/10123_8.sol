contract c10123{
    // Can be called by anyone, in which case we could use a another contract to set the original owner whenever it changes on blockchainfootball.co
    function setOriginalOwner(uint256 _playerCardId, address _address) external {
        require(playerId_ > 0, "Player ID must be set on the contract");
        // As we call .transfer() on buys to send original owners divs we need to make sure this can't be DOS'd through setting the
        // original owner as a smart contract and then reverting any transfer() calls
        // while it would be silly to reject divs it is a valid DOS scenario
        // solium-disable-next-line security/no-tx-origin
        require(msg.sender == tx.origin, "Only valid users are able to set original ownership"); 
        address _cardOwner;
        uint256 _playerId;
        bool _isFirstGeneration;
        (_playerId,_cardOwner,,_isFirstGeneration) = bcfContract_.playerCards(_playerCardId);
        require(_isFirstGeneration, "Card must be an original");
        require(_playerId == playerId_, "Card must tbe the same player this contract relates to");
        require(_cardOwner == _address, "Card must be owned by the address provided");
        // All good, set the address as the original owner, happy div day \o/
        originalOwner_ = _address;
    }
}