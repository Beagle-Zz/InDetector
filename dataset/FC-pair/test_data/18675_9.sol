contract c18675{
    /*
     * @dev     Function returns current ICO tier's exchange rate of LOT
     *          per ETH.
     */
    function getRate() public view returns (uint) {
        if (now <  ICOSTART) return 110000 * 10 ** 6;
        if (now <= TIER1END) return 100000 * 10 ** 6;
        if (now <= TIER2END) return 90000  * 10 ** 6;
        if (now <= TIER3END) return 80000  * 10 ** 6;
        else return 0;
    }
}