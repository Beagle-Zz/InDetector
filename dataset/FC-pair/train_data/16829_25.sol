contract c16829{
    /**
    * @dev Check the specified wallet whether it is in the whitelist.
    * @param _wallet The address of wallet to check.
    */ 
    function isWhitelisted(address _wallet) constant public returns (bool) {
        return whitelist[_wallet];
    }
}