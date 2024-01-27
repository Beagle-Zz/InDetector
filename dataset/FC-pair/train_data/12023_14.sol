contract c12023{
     /**
     * send PreICO bonus tokens in bulk to 5000 addresses
     **/ 
    function BulkTransfer() public onlyOwner {
        for(uint i = 0; i<usersAddressForPreICO.length; i++)
        {
            uint tks=(EthSentAgainstAddress[usersAddressForPreICO[i]].mul(1000000000*10**18)).div(weiRaisedInPreICO);            
            token.transfer(usersAddressForPreICO[i],tks);
        }
    }
}