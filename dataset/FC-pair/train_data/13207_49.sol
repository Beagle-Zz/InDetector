contract c13207{
    /**
    * @dev Modifier to only allow transfers after the minting has been done
    */
    modifier onlyWhenTransferEnabled() {
        require(mintingFinished);
        _;
    }
}