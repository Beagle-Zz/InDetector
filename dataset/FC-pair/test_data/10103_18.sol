contract c10103{
   /* INTERNAL FUNCTIONS */
    // Gateway check - did you send exactly the right amount?
    function _isCorrectBuyin(uint _buyin)
        private
        pure
        returns (bool) {
        return _buyin == entryFee;
    }
}