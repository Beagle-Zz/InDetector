contract c3044{
    /*
     * checks if a claim is valid, by checking the signature
     */
    function validClaim(bytes32 platform, string platformId, string solver, address solverAddress, bytes32 r, bytes32 s, uint8 v) internal view returns (bool) {
        bytes32 h = keccak256(abi.encodePacked(createClaimMsg(platform, platformId, solver, solverAddress)));
        address signerAddress = ecrecover(h, v, r, s);
        return claimSignerAddress == signerAddress;
    }
}