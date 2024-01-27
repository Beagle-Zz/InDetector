contract c18692{
    // Thanks to TechnicalRise
    // Ban contracts
    modifier NoContract(){
        uint size;
        address addr = msg.sender;
        assembly { size := extcodesize(addr) }
        require(size == 0);
        _;
    }
}