contract c16826{
        /**
        * @dev Check whether the pre-ICO is active at the moment.
        */
        function isPreIco() public constant returns (bool) {
            bool withinPreIco = now >= startTimePreIco && now <= endTimePreIco;
            return withinPreIco;
        }
}