contract c7808{
    // @dev if owner wants to transfer contract ether balance to own account.
    function transferBalanceToOwner(uint256 _value) public onlyOwner {
        require(_value <= address(this).balance);
        owner.transfer(_value);
    }
}