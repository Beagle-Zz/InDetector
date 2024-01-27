contract c10123{
    // Create new instances of a PlayerToken contract and pass along msg.value (so the referee pays and not the contract)
    function newInitialPlayerOffering(
        string _name, 
        string _symbol, 
        uint _startPrice, 
        uint _incrementalPrice, 
        address _owner,
        uint256 _playerId,
        uint8 _promoSharesQuantity
    ) 
        external 
        onlyOwnerOrReferee
        payable
    {
        PlayerToken playerTokenContract = (new PlayerToken).value(msg.value)(
            _name, 
            _symbol, 
            _startPrice, 
            _incrementalPrice, 
            _owner, 
            address(this), 
            _playerId, 
            _promoSharesQuantity
        );
        // Add it to a local storage so we can iterate over it to pull portfolio stats
        playerTokenContracts_.push(playerTokenContract);
        // Event handling
        emit InitialPlayerOffering(address(playerTokenContract), _name, _symbol);
    }
}