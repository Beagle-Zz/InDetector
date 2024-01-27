contract c2276{
    // ===========================================
    // Purchase Item
    // ===========================================
    // @dev Buy item with ETH. Take ETH from buyer, transfer token, transfer payment minus fee to seller
    // @param _token  Token contract
    // @param _tokenId   Token Id
    function buyWithETH(address _token, uint _tokenId) public onlyWhitelisted(_token) payable {
        _buy(_token, _tokenId, Currency.ETH, msg.value, msg.sender);
    }
}