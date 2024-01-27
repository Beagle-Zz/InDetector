contract c3575{
    /**
    * @dev Disable the minting of new tokens. Cannot be reversed.
    *
    * @return Whether or not the process was successful.
    */
    function disableMinting() onlyMinter canMint public {
        mintingDisabled = true;
        emit MintingDisabled();
    }
}