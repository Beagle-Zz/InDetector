contract c18281{
    //Self-destruct the contract, contract cannot be destroyed until the vesting period is over.
    function terminate() public onlyOwner onlyWhenReleased {
        selfdestruct(owner);
    }
}