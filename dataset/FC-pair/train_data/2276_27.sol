contract c2276{
    // ===========================================
    // Seller Functions
    // ===========================================
    // Deposit Item
    // @dev deprecated callback (did not handle operator). added to support older contracts
    function onERC721Received(address _from, uint _tokenId, bytes _extraData) external returns(bytes4) {
        _deposit(_from, msg.sender, _tokenId, _extraData);
        return ERC721_RECEIVED_OLD;
    }
}