contract c10639{
    // Modifier to check the length of msg.data
    modifier onlyPayloadSize(uint256 size) {
        if(msg.data.length < size.add(4)) {
            revert();
        }
        _;
    }
}