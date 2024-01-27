contract c12886{
    // Get purchased token of specified address
    function investedCrowdsaleTokenOf(address _owner) public view returns (uint256 balance) {
        return investedCrowdsaleToken[_owner];
    }
}