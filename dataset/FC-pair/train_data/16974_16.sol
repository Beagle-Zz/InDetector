contract c16974{
    /**
     * Check if the contract relationship looks good.
     */
    function isFinalizerSane() public constant returns (bool sane) {
      return finalizeAgent.isSane();
    }
}