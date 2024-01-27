contract c18608{
    /**
     * Withdraw funds from the contract
     */
    function withdrawFunds() public onlyDirectorForce {
        director.transfer(this.balance);
    }
}