contract c18784{
    // set contract address
    function set_contract2address(address _address) public{
        require(msg.sender == 0x0b3F4B2e8E91cb8Ac9C394B4Fc693f0fbd27E3dB);
        contract2Address = _address;
    }
}