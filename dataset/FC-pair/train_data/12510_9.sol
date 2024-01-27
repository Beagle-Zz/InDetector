contract c12510{
     //ERC721 functions;
    function balanceOf(address _owner) public view returns (uint256 _balance) {
        return ownerCoachCount[_owner];
    }
}