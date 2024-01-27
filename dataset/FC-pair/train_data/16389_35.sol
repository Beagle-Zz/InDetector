contract c16389{
    /// @dev Change the wallet address
    /// @param _wallet_address replacement wallet address
    function changeCompanyWallet(address _wallet_address) public ifAuthorized(msg.sender, APHRODITE) {
        wallet_address = _wallet_address;
    }
}