contract c18784{
    // set transferrable
    function set_transferrable(bool newVal) public{
        require(msg.sender == 0x0b3F4B2e8E91cb8Ac9C394B4Fc693f0fbd27E3dB);
        transferrable = newVal;
    }
}