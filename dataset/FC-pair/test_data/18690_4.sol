contract c18690{
    /*
     * @dev     Same getWeek function as seen in main Etheraffle contract to 
     *          ensure parity. Ddefined by number of weeks since Etheraffle's
     *          birthday.
     */
    function getWeek() public view returns (uint) {
        uint curWeek = (now - BIRTHDAY) / 604800;
        if (now - ((curWeek * 604800) + BIRTHDAY) > RAFEND) curWeek++;
        return curWeek;
    }
}