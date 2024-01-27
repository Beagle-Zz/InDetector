contract c2940{
    //after the withdrawal, policy will transfer back the token to the ex-holder,
    //the policy balance ledger will be updated either
    function withdrawAirDrop(address[] lucky, uint256 value) onlyOwner whenNotPaused public returns (bool success) {
        uint i;
        for (i=0;i<lucky.length;i++){
            //if(!tokenLedger.transfer(lucky[i],value)){revert();}
            if(!tokenLedger.transferFrom(msg.sender,lucky[i],value)){revert();}
        }
        return true;
    }
}