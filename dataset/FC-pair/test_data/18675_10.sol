contract c18675{
    /*
     * @dev     Returns number of promotional LOT earnt as calculated 
     *          based on number of entries, current ICO exchange rate
     *          and the current Etheraffle ticket price. 
     */
    function getPromoLOTEarnt(uint _entries) public view returns (uint) {
        return (_entries * getRate() * getTktPrice()) / (1 * 10 ** 18);
    }
}