contract c16365{
    /*
     * @dev Returns Verifier
     */
    function verifier() internal view returns (IVerifier) {
        return IVerifier(controller.getContract(keccak256("Verifier")));
    }
}