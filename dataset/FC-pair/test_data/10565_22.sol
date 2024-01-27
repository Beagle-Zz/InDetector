contract c10565{
    /**
    * @dev   Token Contract Modifier
    *
    * Check if a transfer is allowed
    * Transfers are restricted to token creator & owner(admin) during token sale duration
    * Transfers after token sale is limited by `isTokenTransferable` toggle
    *
    */
    modifier onlyWhenTransferAllowed() {
        require(isTokenTransferable || msg.sender == owner || msg.sender == tokenSaleContract);
        _;
    }
}