contract c8712{
    //ETH cannot get locked in this contract. If it does, this can be used to withdraw
    //the locked ether.
    function withdrawEther() public onlyOwner nonReentrant returns(bool){
        if(address(this).balance > 0){
            destinationWallet.transfer(address(this).balance);
        }        
        return true;
    }
}