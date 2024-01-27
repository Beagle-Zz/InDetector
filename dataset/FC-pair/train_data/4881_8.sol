contract c4881{
    /**
     * Returns asset total supply.
     *
     * @return asset total supply.
     */
    function totalSupply() public view returns (uint) {
        return platform.totalSupply(smbl);
    }
}