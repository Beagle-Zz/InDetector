contract c4881{
    /**
     * Returns asset decimals.
     *
     * @return asset decimals.
     */
    function decimals() public view returns (uint8) {
        return platform.baseUnit(smbl);
    }
}