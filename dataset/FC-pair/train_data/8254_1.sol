contract c8254{
    // Examples of multiplierOnWin() return values:
    // 10 000 indicates 1x returned.
    // 13 000 indicated 1.3x returned
    // 200 000 indicates 20x returned
    function multiplierOnWin() public view returns (uint256)
    {
        uint256 beforeHouseEdge = 10000;
        uint256 afterHouseEdge = beforeHouseEdge - stakeDice.houseEdge();
        return afterHouseEdge * 10000 / winningChance;
    }
}