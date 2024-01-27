contract c16764{
    /*
     * Burn token, only owner is allowed
     *
     * @param value: Amount of AMO Coin to burn
     */
    function burn(uint256 value) public onlyOwner {
        require(transferEnabled);
        super.burn(value);
    }
}