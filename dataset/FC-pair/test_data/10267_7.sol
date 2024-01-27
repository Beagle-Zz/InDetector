contract c10267{
    //@notice Get count of how many tokens an address has
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return ownershipTokenCount[_owner];
    }
}