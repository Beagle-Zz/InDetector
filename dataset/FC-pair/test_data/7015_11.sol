contract c7015{
     /**
      @dev Disable trading
     */
    function disable() onlyAdmin public {
        enabled = false;
    }
}