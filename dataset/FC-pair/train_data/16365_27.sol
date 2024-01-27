contract c16365{
    // Check if sender provided enough payment for verification
    modifier sufficientPayment() {
        require(msg.value >= verifier().getPrice());
        _;
    }
}