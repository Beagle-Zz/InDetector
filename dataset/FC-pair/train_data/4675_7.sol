contract c4675{
    /**
     * Returns asset decimals.
     *
     * @return asset decimals.
     */
    function decimals() constant returns(uint8) {
        return etoken2.baseUnit(etoken2Symbol);
    }
}