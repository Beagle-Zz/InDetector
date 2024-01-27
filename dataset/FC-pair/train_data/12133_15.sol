contract c12133{
    // Function that checks the original EOS token for a balance
    function queryEOSTokenBalance(address _address) view public returns (uint) 
    {
        //return ERC20Basic(eosCrowdsaleAddress).balanceOf(_address);
        EOSContractInterface eosTokenContract = EOSContractInterface(eosTokenAddress);
        return eosTokenContract.balanceOf(_address);
    }
}