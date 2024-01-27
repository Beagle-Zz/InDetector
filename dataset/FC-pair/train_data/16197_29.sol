contract c16197{
    /// Returns true if all purchases are finished.
    function allFinalised() public constant returns (bool) { return now >= endTime && totalAccounted == totalFinalised; }
}