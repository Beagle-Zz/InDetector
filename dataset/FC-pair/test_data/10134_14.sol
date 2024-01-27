contract c10134{
    //ERC721 functions;
    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return ownerPlayerCount[_owner];
    }
}