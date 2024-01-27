contract c10218{
    //ERC721 functions;
    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return ownerPlayerCount[_owner];
    }
}