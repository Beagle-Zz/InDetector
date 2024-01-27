contract c2990{
    // Check that a recipient's allocation has not been generated
    modifier notGenerated(address _recipient) {
        require(!generated[_recipient]);
        _;
    }
}