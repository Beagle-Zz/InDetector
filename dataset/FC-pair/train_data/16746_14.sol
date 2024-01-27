contract c16746{
    // transfer balance to owner
    function withdrawEther() onlyOwner public {
        address addr = this;
        owner.transfer(addr.balance);
    }
}