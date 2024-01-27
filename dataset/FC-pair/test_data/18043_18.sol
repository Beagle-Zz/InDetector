contract c18043{
    // 100,000,000 Seed UFT
    function supplySeed() public view returns (uint256) {
        uint256 _supplySeed = INITIAL_SUPPLY.mul(20).div(100);
        return _supplySeed;
    }
}