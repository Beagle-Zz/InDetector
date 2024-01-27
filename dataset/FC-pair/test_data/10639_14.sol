contract c10639{
    // Modifier to check the issuer
    modifier onlyIssuer() {
        if (msg.sender != issuer) {
            revert();
        }
        _;
    }
}