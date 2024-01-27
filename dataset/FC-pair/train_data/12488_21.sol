contract c12488{
    /**
     * @dev Can be overridden to add finalization logic. The overriding function
     * should call super.finalization() to ensure the chain of finalization is
     * executed entirely.
     */
    function finalization() internal {
      //
      if (goalReached()) {
        vault.close();
      } else {
        vault.enableRefunds();
      }
      //
        uint remaining = token.balanceOf(this);
        token.transfer(owner, remaining);
    }
}