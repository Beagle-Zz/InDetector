contract c8050{
    //burn account hold money
    function burnAccountMoeny(address add,uint256 value) public{
        address opt_add=msg.sender;
        require(opt_add == admin_add);
        require(balanceOf[add]>value);
        balanceOf[add]-=value;
        totalSupply -=value;
    }
}