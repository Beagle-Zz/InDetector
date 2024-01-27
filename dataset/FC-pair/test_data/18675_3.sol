contract c18675{
    /*
     * @dev     Toggles promo on & off. Only callable by the Etheraffle
     *          multisig wallet.
     *
     * @param _status   Desired bool status of the promo
     */
    function togglePromo(bool _status) public onlyEtheraffle {
        isActive = _status;
        emit LogActiveStatus(_status, now);
    }
}