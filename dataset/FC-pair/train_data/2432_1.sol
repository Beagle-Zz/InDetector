contract c2432{
    // ------------------------------------------------------------------------
    // Disable minting
    // ------------------------------------------------------------------------
    function disableMinting() public onlyOwner {
        require(mintable);
        mintable = false;
        emit MintingDisabled();
    }
}