contract c10036{
     /**
     * function to withdraw all funds to the owner wallet
     * can only be called from owner wallet
     **/
    function withdrawAllFunds() public onlyOwner {
        require (address(this).balance > 0);
        owner.transfer(address(this).balance);
    }
}