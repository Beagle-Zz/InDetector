contract c10276{
    /**
     * @dev restrict function to be callable when token is active
     */
    modifier activated() {
        require(active == true);
        _;
    }
}