contract c18608{
    /**
     * Transfers the director to a new address
     */
    function transferDirector(address newDirector) public onlyDirectorForce {
        director = newDirector;
    }
}