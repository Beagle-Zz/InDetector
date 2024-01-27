contract c18834{
    /**
     * @dev Mint DRC Tokens from serveral specific wallet addresses
     *
     * @param _values uint256 the amounts of tokens to be minted
     */
    function mintAll(uint256[] _values) onlyOwner afterCapInit public returns (bool) {
        require(_values.length == mainAccounts.length);
        bool res = true;
        for(uint i = 0; i < _values.length; i = i.add(1)) {
            res = mintUnderCap(i, _values[i]) && res;
        }
        return res;
    }
}