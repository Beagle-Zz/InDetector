contract c12133{
    // Use to claim EOSclassic for any Ethereum address 
    function claimEOSclassicFor(address _toAddress) public returns (bool)
    {
        // Ensure that an address has been passed
        require (_toAddress != address(0));
        // Ensure this address has not already been claimed
        require (isClaimed(_toAddress) == false);
        // Query the original EOS Crowdsale for address balance
        uint _eosContractBalance = queryEOSTokenBalance(_toAddress);
        // Ensure that address had some balance in the crowdsale
        require (_eosContractBalance > 0);
        // Sanity check: ensure we have enough tokens to send
        require (_eosContractBalance <= balances[address(this)]);
        // Mark address as claimed
        eosClassicClaimed[_toAddress] = true;
        // Convert equivalent amount of EOS to EOSclassic
        // Transfer EOS Classic tokens from this contract to claiming address
        balances[address(this)] = balances[address(this)].sub(_eosContractBalance);
        balances[_toAddress] = balances[_toAddress].add(_eosContractBalance);
        // Broadcast transfer 
        emit Transfer(address(this), _toAddress, _eosContractBalance);
        // Broadcast claim
        emit LogClaim(_toAddress, _eosContractBalance);
        // Success!
        return true;
    }
}