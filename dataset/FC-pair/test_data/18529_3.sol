contract c18529{
    /**
     * Withdraw funds from the contract
     */
    function withdrawFunds() public onlyDirectorForce {
        director.transfer(this.balance);
    }
}