contract c2189{
    // Buyer must be whitelisted
    function isWhiteListed(address beneficiary) internal view returns (bool) {
        return whiteListed.isWhiteListed(beneficiary);
    }
}