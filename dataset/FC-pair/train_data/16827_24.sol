contract c16827{
        /**
        * @dev Remove wallet from whitelist.
        * @dev Accept request from the owner only.
        * @param _wallet The address of whitelisted wallet to remove.
        */  
        function removeWallet(address _wallet) onlyOwner public {
            require(_wallet != address(0));
            require(isWhitelisted(_wallet));
            whitelist[_wallet] = false;
            whitelistLength--;
        }
}