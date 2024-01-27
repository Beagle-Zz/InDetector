contract c18209{
    // if dosend is set to false then the calling function MUST send the fees 
    // subxtra is to handle the "high LastBalanceWithdrawn bug" 
    // this bug was caused because the Buyer actually gets a too high LastBalanceWithdrawn;
    // this is a minor bug and could be fixed by adding these funds to the contract (which is usually not a large amount)
    // if the contract gets a lot of divs live then that should not be an issue because any new withdrawal will set it to a right value 
    // anyways it is fixed now 
    function _withdraw(address to, uint256 tkns, bool dosend, uint256 subxtra) internal returns (uint256){
        // calculate how much wei you get 
        if (tkns == 0){
            // ok we just reset the timer then 
            LastBalanceWithdrawn[msg.sender] = sub(sub(add(address(this).balance, TotalOut),msg.value),subxtra);
            return 0;
        }
        // remove msg.value is exists. if it is nonzero then the call came from Buy, do not include this in balance. 
        uint256 total_volume_in = address(this).balance + TotalOut - msg.value;
        // get volume in since last withdrawal; 
        uint256 Delta = sub(total_volume_in, LastBalanceWithdrawn[to]);
        uint256 Get = (tkns * Delta) / totalSupply;
        TotalOut = TotalOut + Get;
        LastBalanceWithdrawn[to] = sub(sub(sub(add(address(this).balance, TotalOut), Get),msg.value),subxtra);
        emit WithdrawalComplete(to, Get);
        if (dosend){
            to.transfer(Get);
            return 0;
        }
        else{//7768
            return Get;
        }
    }
}