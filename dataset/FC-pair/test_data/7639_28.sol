contract c7639{
    // Stops the minting 
    // Mints unsold tokens to owner
    function finalization() internal {
        token.mint(MULTISIG_TKN,tokensUnsold());
        token.finishMinting();
    }
}