contract c7962{
    /*** Destructible functionality adapted from OpenZeppelin ***/
    /**
     * @dev Transfers the current balance to the owner and terminates the contract.
     */
    function destroy() onlyCEO public {
        selfdestruct(ceoAddress);
    }
}