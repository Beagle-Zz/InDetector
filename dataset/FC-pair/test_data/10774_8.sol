contract c10774{
    /* transferAndNotify based on an  instruction signed offline  */
    function delegatedTransferAndNotify(address from, TokenReceiver target, uint amount, uint data,
                                     uint maxExecutorFeeInToken, /* client provided max fee for executing the tx */
                                     bytes32 nonce, /* random nonce generated by client */
                                     /* ^^^^ end of signed data ^^^^ */
                                     bytes signature,
                                     uint requestedExecutorFeeInToken /* the executor can decide to request lower fee */
                                     )
    external {
        bytes32 txHash = keccak256(abi.encodePacked(this, from, target, amount, data, maxExecutorFeeInToken, nonce));
        _checkHashAndTransferExecutorFee(txHash, signature, from, maxExecutorFeeInToken, requestedExecutorFeeInToken);
        _transfer(from, target, amount, "");
        target.transferNotification(from, amount, data);
    }
}