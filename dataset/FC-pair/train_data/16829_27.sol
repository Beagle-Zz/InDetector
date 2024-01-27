contract c16829{
    /**
    * @dev Check whether the ICO is active at the moment.
    */
    function isIco() public constant returns (bool) {
        bool withinIco = now >= startTimeIco && now <= endTimeIco;
        return withinIco;
    }
}