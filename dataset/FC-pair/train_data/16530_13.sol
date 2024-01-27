contract c16530{
    /**
     * An address can become a new seller only in case it has no tokens.
     * This is required to prevent stealing of tokens  from newSeller via 
     * 2 calls of this function.
     */
    function changeSeller(address newSeller) onlyOwner public returns (bool) {
        require(newSeller != address(0));
        require(seller != newSeller);
        // To prevent stealing of tokens from newSeller via 2 calls of changeSeller:
        require(balances[newSeller] == 0);
        address oldSeller = seller;
        uint256 unsoldTokens = balances[oldSeller];
        balances[oldSeller] = 0;
        balances[newSeller] = unsoldTokens;
        Transfer(oldSeller, newSeller, unsoldTokens);
        seller = newSeller;
        ChangeSellerEvent(oldSeller, newSeller);
        return true;
    }
}