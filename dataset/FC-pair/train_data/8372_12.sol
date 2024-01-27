contract c8372{
    /**
    * @dev Allows the current owner to transfer the signer of the contract to a newSigner.
    * @param newSigner The address to transfer signership to.
    */
    function transferSigner(address newSigner) public onlyOwner {
        require(newSigner != address(0));
        emit SignerTransferred(signer, newSigner);
        signer = newSigner;
    }
}