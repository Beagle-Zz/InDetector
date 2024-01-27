contract c16434{
    /**
        Private Methods
    */
    // Credit to Rob Hitchens: https://stackoverflow.com/a/42739843
    function percent(uint numerator, uint denominator, uint precision) private pure returns (uint quotient) {
        uint _numerator = numerator * 10 ** (precision+1);
        uint _quotient = ((_numerator / denominator) + 5) / 10;
        return ( _quotient);
    }
}