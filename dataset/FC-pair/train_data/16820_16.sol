contract c16820{
    /**
     * Activation of the token allows all tokenholders to operate with the token
     */
    function activate() external onlyOwner returns (bool) {
        isActivated = true;
        return true;
    }
}