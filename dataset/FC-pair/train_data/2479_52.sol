contract c2479{
    /**
     * @notice End token minting period permanently for Issuer
     */
    function finishMintingIssuer() public onlyOwner {
        finishedIssuerMinting = true;
        emit LogFinishMintingIssuer(now);
    }
}