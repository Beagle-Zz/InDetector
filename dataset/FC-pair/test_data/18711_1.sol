contract c18711{
    // if dosend is set to false then the calling function MUST send the fees 
    function _withdraw(address to, uint256 tkns, bool dosend) internal returns (uint256){
        // calculate how much wei you get 
        if (tkns == 0){
            // ok we just reset the timer then 
            LastBalanceWithdrawn[msg.sender] = sub(add(address(this).balance, TotalOut),msg.value);
            return;
        }
        // remove msg.value is exists. if it is nonzero then the call came from Buy, do not include this in balance. 
        uint256 total_volume_in = address(this).balance + TotalOut - msg.value;
        // get volume in since last withdrawal; 
        uint256 Delta = sub(total_volume_in, LastBalanceWithdrawn[to]);
        uint256 Get = (tkns * Delta) / totalSupply;
        TotalOut = TotalOut + Get;
        LastBalanceWithdrawn[to] = sub(sub(add(address(this).balance, TotalOut), Get),msg.value);
        emit WithdrawalComplete(to, Get);
        if (dosend){
            to.transfer(Get);
            return 0;
        }
        else{
            return Get;
        }
    }
}