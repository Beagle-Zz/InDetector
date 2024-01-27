contract c18422{
    // DSTWalletLMNO related modifer
    // @dev Throws if called by any account other than the DSTWalletLMNO owner
    modifier onlyDSTWalletLMNO() {
        require(msg.sender == dstWalletLMNO);
        _;
    }
}