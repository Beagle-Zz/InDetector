contract c16365{
    // Check if sender is Verifier
    modifier onlyVerifier() {
        require(msg.sender == controller.getContract(keccak256("Verifier")));
        _;
    }
}