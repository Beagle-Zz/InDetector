contract c18192{
    /**
    * dev Fix for eht ERC20 short address attack.
    */
    modifier onlyPayloadSize(uint size) {
        if(msg.data.length < size + 4){
            throw;
        }
        _;
    }
}