contract c12133{
    // Function that returns any registered EOS address from the original EOS crowdsale
    function queryEOSCrowdsaleKey(address _address) view public returns (string) 
    {
        EOSContractInterface eosCrowdsaleContract = EOSContractInterface(eosCrowdsaleAddress);
        return eosCrowdsaleContract.keys(_address);
    }
}