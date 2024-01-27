contract c3054{
    // need to auto calc max bet
    // private functions
    function private_addPermittedRoll(uint256 _rollUnder) public onlyOwner {
        permittedRolls[_rollUnder] = true;
    }
}