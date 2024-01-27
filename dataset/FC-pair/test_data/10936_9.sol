contract c10936{
    /**
     @dev Enable trading
     */
     function enable() onlyAdmin public {
         enabled = true;
     }
}