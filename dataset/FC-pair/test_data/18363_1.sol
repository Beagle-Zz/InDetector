contract c18363{
    /**
     *  Modifier for checking token transfer
     */
    modifier canTransferToken(address _from) {
        if (_from != owner) {
            require(transferAllowed);
        }
        if (_from == teamWallet1) {
            require(now >= endTime + 15552000);
        }
        if (_from == teamWallet2) {
            require(now >= endTime + 31536000);
        }
        _;
    }
}