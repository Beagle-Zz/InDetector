contract c10927{
    /**
    * @dev Disables the contract and wipes all the balances, can be used only by owner
    */
    function killContract() public onlyOwner {
        selfdestruct(owner);
    }
}