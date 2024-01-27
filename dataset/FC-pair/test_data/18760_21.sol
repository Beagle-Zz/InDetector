contract c18760{
    // @return true if ICO event has ended
    function hasEndedIco() internal constant returns (bool) {
        return now > endTimeIco;
    }
}