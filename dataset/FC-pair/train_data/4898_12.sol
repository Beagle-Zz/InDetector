contract c4898{
    /**
     * Returns asset decimals.
     *
     * @return asset decimals.
     */
    function decimals() public view returns (uint8) {
        return platform.baseUnit(smbl);
    }
}