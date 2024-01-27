contract c18834{
    /**
     * @dev Mint DRC Tokens from serveral specific wallet addresses upto cap limitation
     *
     */
    function mintUptoCap() onlyOwner afterCapInit public returns (bool) {
        bool res = true;
        for(uint i = 0; i < mainAccounts.length; i = i.add(1)) {
            require(MintableToken(ownedContract).balanceOf(mainAccounts[i]) == 0);
            res = MintableToken(ownedContract).mint(mainAccounts[i], accountCaps[mainAccounts[i]]) && res;
        }
        require(res);
        return MintableToken(ownedContract).finishMinting(); // when up to cap limit, then stop minting.
    }
}