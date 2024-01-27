contract c16884{
        //after the call token is available for exchange
        function releaseForTransfer() public onlyCrowdsaleOrOwner {
          require(!releasedForTransfer);
          releasedForTransfer = true;
        }
}