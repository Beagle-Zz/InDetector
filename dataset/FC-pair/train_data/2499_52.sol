contract c2499{
    /**
     * @notice End token minting period permanently for Issuer
     */
    function finishMintingIssuer() public onlyOwner {
        finishedIssuerMinting = true;
        emit LogFinishMintingIssuer(now);
    }
}