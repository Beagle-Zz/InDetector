contract c10630{
    /**
     * @dev Transfers the current balance to the owner and terminates the contract.
     */
    function destroy() onlyOwner public {
        selfdestruct(owner);
    }
}