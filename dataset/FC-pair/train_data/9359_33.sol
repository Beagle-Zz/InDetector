contract c9359{
    // functions below this line are onlyPayloadSize
    // TODO: investigate this security optimization more
    modifier onlyPayloadSize(uint numwords) {
        assert(msg.data.length >= numwords.mul(32).add(4));
        _;
    }
}