contract c13707{
    ////kill the contract
    function killContract() public onlyOwner{
        selfdestruct(ownerAddr);
    }
}