contract c10093{
    /**
     * Returns asset total supply.
     *
     * @return asset total supply.
     */
    function totalSupply() constant returns(uint) {
        return etoken2.totalSupply(etoken2Symbol);
    }
}