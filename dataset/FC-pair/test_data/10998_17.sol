contract c10998{
   /* INTERNAL FUNCTIONS */
    // Gateway check - did you send exactly the right amount?
    function _isCorrectBuyin(uint _buyin) 
        private
        pure
        returns (bool) {
        return _buyin == 0.2018 ether;
    }
}