contract c7015{
    /**
     @dev Enable trading
     */
    function enable() onlyAdmin public {
        enabled = true;
    }
}